require 'rubygems'
require 'tmpdir'
require 'fileutils'
require 'securerandom'
require 'bigdecimal'
require 'fb'
require 'minitest/autorun'

class FbTestCase < MiniTest::Test
  include Fb

  def setup
    @db_host = ENV.fetch('DB_HOST') { '0.0.0.0' }
    @parms = get_db_conn_params("drivertest.fdb")
    @parms_s = get_db_conn_string(@parms)
    @db_file = @parms[:database].split(":", 2).last
    @fb_version = get_fb_version
  end

  def teardown
    Database.drop(@parms) rescue nil
  end

  def get_db_conn_params(dbname = nil)
    dbname ||= "drivertest.%s.fdb" % SecureRandom.hex(24)

    db_file = case RUBY_PLATFORM
              when /win32/
                File.join("c:", "var", "fbdata", dbname)
              else
                File.join("/", "db", dbname)
              end
    {
      :database => "#{@db_host}:#{db_file}",
      :username => "sysdba",
      :password => "masterkey",
      :charset => 'NONE',
      :role => 'READER'
    }
  end

  def get_db_conn_string(params = nil)
    params ||= get_db_conn_params
    "database = #{params[:database]}; username = #{params[:username]}; password = #{params[:password]}; charset = NONE; role = READER;"
  end

  def get_fb_version
    @@fb_version ||= begin
      version = -1
      params = get_db_conn_params("fbversion.fdb")
      begin
        Database.create(params) do |connection|
          d = connection.query("SELECT substring(rdb$get_context('SYSTEM', 'ENGINE_VERSION') from 1 for 1) from rdb$database")
          version = Integer(d.first[0])
          connection.drop
        end
      ensure
        Database.drop(params) rescue nil
      end
      version
    end
  end

  def with_database
    Database.create(@parms) do |connection|
      yield connection
    ensure
      connection.drop
    end
  end
end

class Fb::Connection
  def execute_script(sql_schema)
    self.transaction do
      sql_schema.strip.split(';').each do |stmt|
        self.execute(stmt)
      end
    end
  end
end