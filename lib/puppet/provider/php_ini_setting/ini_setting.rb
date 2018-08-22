Puppet::Type.type(:php_ini_setting).provide(:ini_setting, :parent => Puppet::Type.type(:ini_setting).provider(:ruby)) do

  desc 'Manage php.ini settings with inifile module.'

  # implement section as the first part of the namevar¶
  def section
    resource[:name].split('/', 2).first
  end

  # implement setting as the second part of the namevar
  def setting
    resource[:name].split('/', 2).last
  end

  # hard code the file path (this allows purging)
  def self.file_path
    '/etc/php.ini'
  end
end
