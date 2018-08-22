require 'spec_helper'

describe 'php' do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('php::config') }
      it { is_expected.to contain_class('php::install') }
      it { is_expected.to contain_class('php::extension::curl') }
      it { is_expected.to contain_class('php::extension::fileinfo') }
      it { is_expected.to contain_class('php::extension::json') }
      it { is_expected.to contain_class('php::extension::phar') }
      it { is_expected.to contain_class('php::extension::zip') }
      it { is_expected.to contain_file('/etc/php.d') }
      it { is_expected.to contain_file('/etc/php.d/curl.ini') }
      it { is_expected.to contain_file('/etc/php.d/fileinfo.ini') }
      it { is_expected.to contain_file('/etc/php.d/json.ini') }
      it { is_expected.to contain_file('/etc/php.d/phar.ini') }
      it { is_expected.to contain_file('/etc/php.d/zip.ini') }
      it { is_expected.to contain_file('/etc/php.ini') }
      it { is_expected.to contain_package('php-common') }
      it { is_expected.to contain_php_ini_setting('PHP/allow_url_fopen') }
      it { is_expected.to contain_php_ini_setting('PHP/allow_url_include') }
      it { is_expected.to contain_php_ini_setting('PHP/asp_tags') }
      it { is_expected.to contain_php_ini_setting('PHP/auto_append_file') }
      it { is_expected.to contain_php_ini_setting('PHP/auto_globals_jit') }
      it { is_expected.to contain_php_ini_setting('PHP/auto_prepend_file') }
      it { is_expected.to contain_php_ini_setting('PHP/default_mimetype') }
      it { is_expected.to contain_php_ini_setting('PHP/default_socket_timeout') }
      it { is_expected.to contain_php_ini_setting('PHP/disable_classes') }
      it { is_expected.to contain_php_ini_setting('PHP/disable_functions') }
      it { is_expected.to contain_php_ini_setting('PHP/display_errors') }
      it { is_expected.to contain_php_ini_setting('PHP/display_startup_errors') }
      it { is_expected.to contain_php_ini_setting('PHP/doc_root') }
      it { is_expected.to contain_php_ini_setting('PHP/enable_dl') }
      it { is_expected.to contain_php_ini_setting('PHP/engine') }
      it { is_expected.to contain_php_ini_setting('PHP/error_reporting') }
      it { is_expected.to contain_php_ini_setting('PHP/expose_php') }
      it { is_expected.to contain_php_ini_setting('PHP/file_uploads') }
      it { is_expected.to contain_php_ini_setting('PHP/html_errors') }
      it { is_expected.to contain_php_ini_setting('PHP/ignore_repeated_errors') }
      it { is_expected.to contain_php_ini_setting('PHP/ignore_repeated_source') }
      it { is_expected.to contain_php_ini_setting('PHP/implicit_flush') }
      it { is_expected.to contain_php_ini_setting('PHP/log_errors') }
      it { is_expected.to contain_php_ini_setting('PHP/log_errors_max_len') }
      it { is_expected.to contain_php_ini_setting('PHP/max_execution_time') }
      it { is_expected.to contain_php_ini_setting('PHP/max_input_time') }
      it { is_expected.to contain_php_ini_setting('PHP/memory_limit') }
      it { is_expected.to contain_php_ini_setting('PHP/output_buffering') }
      it { is_expected.to contain_php_ini_setting('PHP/post_max_size') }
      it { is_expected.to contain_php_ini_setting('PHP/precision') }
      it { is_expected.to contain_php_ini_setting('PHP/register_argc_argv') }
      it { is_expected.to contain_php_ini_setting('PHP/report_memleaks') }
      it { is_expected.to contain_php_ini_setting('PHP/request_order') }
      it { is_expected.to contain_php_ini_setting('PHP/serialize_precision') }
      it { is_expected.to contain_php_ini_setting('PHP/short_open_tag') }
      it { is_expected.to contain_php_ini_setting('PHP/track_errors') }
      it { is_expected.to contain_php_ini_setting('PHP/unserialize_callback_func') }
      it { is_expected.to contain_php_ini_setting('PHP/upload_max_filesize') }
      it { is_expected.to contain_php_ini_setting('PHP/user_dir') }
      it { is_expected.to contain_php_ini_setting('PHP/variables_order') }
      it { is_expected.to contain_php_ini_setting('PHP/zlib.output_compression') }
      it { is_expected.to contain_php_ini_setting('SQL/sql.safe_mode') }
      it { is_expected.to contain_php_ini_setting('Session/session.auto_start') }
      it { is_expected.to contain_php_ini_setting('Session/session.bug_compat_42') }
      it { is_expected.to contain_php_ini_setting('Session/session.bug_compat_warn') }
      it { is_expected.to contain_php_ini_setting('Session/session.cache_expire') }
      it { is_expected.to contain_php_ini_setting('Session/session.cache_limiter') }
      it { is_expected.to contain_php_ini_setting('Session/session.cookie_domain') }
      it { is_expected.to contain_php_ini_setting('Session/session.cookie_httponly') }
      it { is_expected.to contain_php_ini_setting('Session/session.cookie_lifetime') }
      it { is_expected.to contain_php_ini_setting('Session/session.cookie_path') }
      it { is_expected.to contain_php_ini_setting('Session/session.gc_divisor') }
      it { is_expected.to contain_php_ini_setting('Session/session.gc_maxlifetime') }
      it { is_expected.to contain_php_ini_setting('Session/session.gc_probability') }
      it { is_expected.to contain_php_ini_setting('Session/session.hash_bits_per_character') }
      it { is_expected.to contain_php_ini_setting('Session/session.hash_function') }
      it { is_expected.to contain_php_ini_setting('Session/session.name') }
      it { is_expected.to contain_php_ini_setting('Session/session.referer_check') }
      it { is_expected.to contain_php_ini_setting('Session/session.save_handler') }
      it { is_expected.to contain_php_ini_setting('Session/session.serialize_handler') }
      it { is_expected.to contain_php_ini_setting('Session/session.use_cookies') }
      it { is_expected.to contain_php_ini_setting('Session/session.use_only_cookies') }
      it { is_expected.to contain_php_ini_setting('Session/session.use_trans_sid') }
      it { is_expected.to contain_php_ini_setting('Session/url_rewriter.tags') }
      it { is_expected.to contain_php_ini_setting('mail function/SMTP') }
      it { is_expected.to contain_php_ini_setting('mail function/mail.add_x_header') }
      it { is_expected.to contain_php_ini_setting('mail function/sendmail_path') }
      it { is_expected.to contain_php_ini_setting('mail function/smtp_port') }
      it { is_expected.to contain_php__extension('curl') }
      it { is_expected.to contain_php__extension('fileinfo') }
      it { is_expected.to contain_php__extension('json') }
      it { is_expected.to contain_php__extension('phar') }
      it { is_expected.to contain_php__extension('zip') }
      it { is_expected.to contain_php__setting('PHP/allow_url_fopen') }
      it { is_expected.to contain_php__setting('PHP/allow_url_include') }
      it { is_expected.to contain_php__setting('PHP/asp_tags') }
      it { is_expected.to contain_php__setting('PHP/auto_append_file') }
      it { is_expected.to contain_php__setting('PHP/auto_globals_jit') }
      it { is_expected.to contain_php__setting('PHP/auto_prepend_file') }
      it { is_expected.to contain_php__setting('PHP/default_mimetype') }
      it { is_expected.to contain_php__setting('PHP/default_socket_timeout') }
      it { is_expected.to contain_php__setting('PHP/disable_classes') }
      it { is_expected.to contain_php__setting('PHP/disable_functions') }
      it { is_expected.to contain_php__setting('PHP/display_errors') }
      it { is_expected.to contain_php__setting('PHP/display_startup_errors') }
      it { is_expected.to contain_php__setting('PHP/doc_root') }
      it { is_expected.to contain_php__setting('PHP/enable_dl') }
      it { is_expected.to contain_php__setting('PHP/engine') }
      it { is_expected.to contain_php__setting('PHP/error_reporting') }
      it { is_expected.to contain_php__setting('PHP/expose_php') }
      it { is_expected.to contain_php__setting('PHP/file_uploads') }
      it { is_expected.to contain_php__setting('PHP/html_errors') }
      it { is_expected.to contain_php__setting('PHP/ignore_repeated_errors') }
      it { is_expected.to contain_php__setting('PHP/ignore_repeated_source') }
      it { is_expected.to contain_php__setting('PHP/implicit_flush') }
      it { is_expected.to contain_php__setting('PHP/log_errors') }
      it { is_expected.to contain_php__setting('PHP/log_errors_max_len') }
      it { is_expected.to contain_php__setting('PHP/max_execution_time') }
      it { is_expected.to contain_php__setting('PHP/max_input_time') }
      it { is_expected.to contain_php__setting('PHP/memory_limit') }
      it { is_expected.to contain_php__setting('PHP/output_buffering') }
      it { is_expected.to contain_php__setting('PHP/post_max_size') }
      it { is_expected.to contain_php__setting('PHP/precision') }
      it { is_expected.to contain_php__setting('PHP/register_argc_argv') }
      it { is_expected.to contain_php__setting('PHP/report_memleaks') }
      it { is_expected.to contain_php__setting('PHP/request_order') }
      it { is_expected.to contain_php__setting('PHP/serialize_precision') }
      it { is_expected.to contain_php__setting('PHP/short_open_tag') }
      it { is_expected.to contain_php__setting('PHP/track_errors') }
      it { is_expected.to contain_php__setting('PHP/unserialize_callback_func') }
      it { is_expected.to contain_php__setting('PHP/upload_max_filesize') }
      it { is_expected.to contain_php__setting('PHP/user_dir') }
      it { is_expected.to contain_php__setting('PHP/variables_order') }
      it { is_expected.to contain_php__setting('PHP/zlib.output_compression') }
      it { is_expected.to contain_php__setting('SQL/sql.safe_mode') }
      it { is_expected.to contain_php__setting('Session/session.auto_start') }
      it { is_expected.to contain_php__setting('Session/session.bug_compat_42') }
      it { is_expected.to contain_php__setting('Session/session.bug_compat_warn') }
      it { is_expected.to contain_php__setting('Session/session.cache_expire') }
      it { is_expected.to contain_php__setting('Session/session.cache_limiter') }
      it { is_expected.to contain_php__setting('Session/session.cookie_domain') }
      it { is_expected.to contain_php__setting('Session/session.cookie_httponly') }
      it { is_expected.to contain_php__setting('Session/session.cookie_lifetime') }
      it { is_expected.to contain_php__setting('Session/session.cookie_path') }
      it { is_expected.to contain_php__setting('Session/session.gc_divisor') }
      it { is_expected.to contain_php__setting('Session/session.gc_maxlifetime') }
      it { is_expected.to contain_php__setting('Session/session.gc_probability') }
      it { is_expected.to contain_php__setting('Session/session.hash_bits_per_character') }
      it { is_expected.to contain_php__setting('Session/session.hash_function') }
      it { is_expected.to contain_php__setting('Session/session.name') }
      it { is_expected.to contain_php__setting('Session/session.referer_check') }
      it { is_expected.to contain_php__setting('Session/session.save_handler') }
      it { is_expected.to contain_php__setting('Session/session.serialize_handler') }
      it { is_expected.to contain_php__setting('Session/session.use_cookies') }
      it { is_expected.to contain_php__setting('Session/session.use_only_cookies') }
      it { is_expected.to contain_php__setting('Session/session.use_trans_sid') }
      it { is_expected.to contain_php__setting('Session/url_rewriter.tags') }
      it { is_expected.to contain_php__setting('mail function/SMTP') }
      it { is_expected.to contain_php__setting('mail function/mail.add_x_header') }
      it { is_expected.to contain_php__setting('mail function/sendmail_path') }
      it { is_expected.to contain_php__setting('mail function/smtp_port') }
      it { is_expected.to contain_resources('php_ini_setting') }

      case facts[:os]['release']['major']
      when '6'
        it { is_expected.to contain_php_ini_setting('PHP/allow_call_time_pass_reference') }
        it { is_expected.to contain_php_ini_setting('PHP/magic_quotes_gpc') }
        it { is_expected.to contain_php_ini_setting('PHP/magic_quotes_runtime') }
        it { is_expected.to contain_php_ini_setting('PHP/magic_quotes_sybase') }
        it { is_expected.to contain_php_ini_setting('PHP/register_globals') }
        it { is_expected.to contain_php_ini_setting('PHP/register_long_arrays') }
        it { is_expected.to contain_php_ini_setting('PHP/safe_mode') }
        it { is_expected.to contain_php_ini_setting('PHP/safe_mode_allowed_env_vars') }
        it { is_expected.to contain_php_ini_setting('PHP/safe_mode_exec_dir') }
        it { is_expected.to contain_php_ini_setting('PHP/safe_mode_gid') }
        it { is_expected.to contain_php_ini_setting('PHP/safe_mode_include_dir') }
        it { is_expected.to contain_php_ini_setting('PHP/safe_mode_protected_env_vars') }
        it { is_expected.to contain_php_ini_setting('PHP/y2k_compliance') }
        it { is_expected.to contain_php_ini_setting('Session/session.entropy_file') }
        it { is_expected.to contain_php_ini_setting('Session/session.entropy_length') }
        it { is_expected.to contain_php_ini_setting('Session/session.save_path') }
        it { is_expected.to contain_php_ini_setting('Syslog/define_syslog_variables') }
        it { is_expected.to contain_php__setting('PHP/allow_call_time_pass_reference') }
        it { is_expected.to contain_php__setting('PHP/magic_quotes_gpc') }
        it { is_expected.to contain_php__setting('PHP/magic_quotes_runtime') }
        it { is_expected.to contain_php__setting('PHP/magic_quotes_sybase') }
        it { is_expected.to contain_php__setting('PHP/register_globals') }
        it { is_expected.to contain_php__setting('PHP/register_long_arrays') }
        it { is_expected.to contain_php__setting('PHP/safe_mode') }
        it { is_expected.to contain_php__setting('PHP/safe_mode_allowed_env_vars') }
        it { is_expected.to contain_php__setting('PHP/safe_mode_exec_dir') }
        it { is_expected.to contain_php__setting('PHP/safe_mode_gid') }
        it { is_expected.to contain_php__setting('PHP/safe_mode_include_dir') }
        it { is_expected.to contain_php__setting('PHP/safe_mode_protected_env_vars') }
        it { is_expected.to contain_php__setting('PHP/y2k_compliance') }
        it { is_expected.to contain_php__setting('Session/session.entropy_file') }
        it { is_expected.to contain_php__setting('Session/session.entropy_length') }
        it { is_expected.to contain_php__setting('Session/session.save_path') }
        it { is_expected.to contain_php__setting('Syslog/define_syslog_variables') }
      else
        it { is_expected.to contain_php_ini_setting('PHP/max_file_uploads') }
        it { is_expected.to contain_php_ini_setting('PHP/zend.enable_gc') }
        it { is_expected.to contain_php__setting('PHP/max_file_uploads') }
        it { is_expected.to contain_php__setting('PHP/zend.enable_gc') }
      end
    end
  end
end
