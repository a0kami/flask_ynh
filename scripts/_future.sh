
#=================================================
# SQLITE HELPERS
#=================================================

# Create a sqlite database file
#
# usage: ynh_sqlite_setup_db --db_name=db
# | arg: -n, --db_name - the database name to create
ynh_sqlite_setup_db() {
    local legacy_args=n
    local -A args_array=( [n]=db_name= )
    # Manage arguments with getopts
    ynh_handle_getopts_args "$@"

    sqlite3 <<< ".save /var/www/${db_name}/${db_name}.sqlite3"
}

# Remove a database
#
# usage: ynh_sqlite_remove_db --db_name=db
# | arg: -n, --db_name - the database name to drop
ynh_sqlite_remove_db() {
    local legacy_args=n
    local -A args_array=( [n]=db_name= )
    # Manage arguments with getopts
    ynh_handle_getopts_args "$@"

    shred -u "/var/www/${db_name}/${db_name}.sqlite3"
}

# Dump a database
#
# example: ynh_sqlite_dump_db --db_name='roundcube' > ./dump.sql
#
# usage: ynh_sqlite_dump_db --db_name=db
# | arg: -n, --db_name - the database name to dump
# | ret: the sqlitedump output
ynh_sqlite_dump_db() {
    local legacy_args=n
    local -A args_array=( [n]=db_name= )
    # Manage arguments with getopts
    ynh_handle_getopts_args "$@"

    sqlite3 "/var/www/${db_name}/${db_name}.sqlite3" <<< ".dump"
}
