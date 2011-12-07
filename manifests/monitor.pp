class mmm::monitor {
  
  include mmm::common
  
  package { "mysql-mmm-monitor":
    ensure => installed
  }
  
  file { "/etc/mysql-mmm":
    ensure => "directory",
      mode    => 0755,
      owner   => "root", 
      group   => "root",
    
  }
  file { "/etc/default/mysql-mmm-monitor":
    ensure  => present,
    mode  => 0644,
    owner  => "root",
    group  => "root",
    content   => template("mmm/mon-default.erb"),
    require   => Package["mysql-mmm-monitor"],
  }  

}