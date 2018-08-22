Puppet::Type.newtype(:php_ini_setting) do
  desc <<-DESC
Manage a php.ini setting.
@example Using the type
  php_ini_setting { 'PHP/engine':
    value => 'On',
  }
DESC

  ensurable

  newparam(:name, :namevar => true) do
    desc 'Section/setting name to manage from php.ini'
    # namevar should be of the form section/setting
    newvalues(/\S+\/\S+/)
  end

  newproperty(:value) do
    desc 'The value of the setting to define'
    munge do |v|
      v.to_s.strip
    end
  end
end
