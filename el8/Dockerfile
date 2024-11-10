FROM rockylinux:8.9
ENV container docker

RUN echo 'root:pigsty' | chpasswd
RUN mkdir -p /etc/yum.repos.d/backup && mkdir -p /root/.ssh && cp -f /etc/yum.repos.d/*.repo /etc/yum.repos.d/backup/ && rm -rf /etc/yum.repos.d/*.repo
COPY pigsty.repo /etc/yum.repos.d/pigsty.repo

RUN dnf makecache && dnf -y install systemd openssh-server sudo glibc-locale-source glibc-langpack-en createrepo_c dnf-utils sshpass modulemd-tools ansible python3.12-jmespath \
    strace lz4 unzip bzip2 zlib yum pv jq git ncdu make patch bash lsof wget uuid tuned nvme-cli numactl grubby sysstat iotop htop rsync tcpdump chrony python3 \
    netcat socat ftp lrzsz net-tools ipvsadm bind-utils telnet audit ca-certificates openssl readline vim-minimal node_exporter etcd haproxy python3-pip \
    grafana loki logcli promtail prometheus2 alertmanager pushgateway node_exporter blackbox_exporter nginx_exporter pg_exporter nginx dnsmasq ansible etcd python3-requests redis mcli \
    postgresql17* pgbouncer pg_exporter pgbadger vip-manager patroni patroni-etcd pgbackrest \
    timescaledb-2-postgresql-17* periods_17* temporal_tables_17* e-maj_17* table_version_17* pg_cron_17* pg_later_17 pg_background_17* postgis35_17* pgrouting_17* pointcloud_17* q3c_17* geoip_17* pg_polyline_17 pg_geohash_17* \
    pgvector_17* pgvectorscale_17 pg_vectorize_17 pg_similarity_17* smlar_17* pg_summarize_17 pg_tiktoken_17 pg4ml_17 pg_search_17 pg_bigm_17* zhparser_17* hunspell_cs_cz_17 hunspell_de_de_17 hunspell_en_us_17 hunspell_fr_17 hunspell_ne_np_17 hunspell_nl_nl_17 hunspell_nn_no_17 hunspell_pt_pt_17 hunspell_ru_ru_17 hunspell_ru_ru_aot_17 \
    pg_analytics_17 pg_duckdb_17* pg_mooncake_17* duckdb_fdw_17* pg_parquet_17 pg_fkpart_17* plproxy_17* hll_17* rum_17 pg_graphql_17 pg_jsonschema_17 jsquery_17* pg_hint_plan_17* hypopg_17* index_advisor_17 pg_plan_filter_17* imgsmlr_17* pg_ivm_17* pgmq_17 pgq_17* pg_cardano_17 \
    pg_tle_17* plv8_17* pllua_17* pldebugger_17* plpgsql_check_17* plprofiler_17* plsh_17* prefix_17* semver_17* postgresql-unit_17* md5hash_17* asn1oid_17* pg_roaringbitmap_17* pgfaceting_17 pgsphere_17* pg_country_17* pg_currency_17* pgmp_17* numeral_17* pg_rational_17* pguint_17* pg_uint128_17* ip4r_17* pg_uri_17* pg_emailaddr_17* acl_17* timestamp9_17* chkpass_17* \
    topn_17* pgsql_gzip_17* pg_zstd_17* pgsql_http_17* pg_net_17* pg_smtp_client_17 pg_html5_email_address_17 pgsql_tweaks_17* pg_extra_time_17* pg_timeit_17* count_distinct_17* extra_window_functions_17* first_last_agg_17 tdigest_17* aggs_for_vecs_17* aggs_for_arrays_17* pg_arraymath_17* quantile_17* lower_quantile_17* \
    pg_idkit_17 pg_uuidv7_17* permuteseq_17* pg_hashids_17* sequential_uuids_17 pg_math_17* pg_random_17* pg_base36_17* pg_base62_17* pg_base58_17 floatvec_17* pg_financial_17* pgjwt_17* pg_hashlib_17 postgres_shacrypt_17* cryptint_17* pg_ecdsa_17* pgpcre_17 icu_ext_17* pgqr_17* pg_envvar_17* pg_protobuf_17 url_encode_17* \
    pg_repack_17* pg_squeeze_17* pg_dirtyread_17* pgfincore_17* ddlx_17* pg_prioritize_17* pg_readonly_17* safeupdate_17* pg_permissions_17* pg_catcheck_17* preprepare_17* pgcozy_17 pg_orphaned_17* pg_crash_17* pg_cheat_funcs_17* pg_savior_17* table_log_17 pg_fio_17 \
    pg_profile_17* pg_show_plans_17* pg_stat_kcache_17* pg_stat_monitor_17* pg_qualstats_17* pg_track_settings_17* pg_wait_sampling_17* system_stats_17* pg_meta_17 pgnodemx_17 pg_sqlog_17* bgw_replstatus_17* pgmeminfo_17* toastinfo_17* pg_explain_ui_17 pg_relusage_17 pagevis_17 \
    passwordcheck_cracklib_17* supautils_17* pgsodium_17* vault_17* pg_session_jwt_17 postgresql_anonymizer_17* pgsmcrypto_17 pgaudit_17* pgauditlogtofile_17* pg_auth_mon_17* credcheck_17* pgcryptokey_17 pg_jobmon_17* logerrors_17* login_hook_17* set_user_17* pg_snakeoil_17* pgextwlist_17* pg_auditor_17 sslutils_17* noset_17* \
    wrappers_17 multicorn2_17* mysql_fdw_17* tds_fdw_17* sqlite_fdw_17* pgbouncer_fdw_17* redis_fdw_17* pg_redis_pubsub_17* hdfs_fdw_17* firebird_fdw_17 aws_s3_17 log_fdw_17* orafce_17* pgtt_17* session_variable_17* pg_statement_rollback_17* pg_dbms_metadata_17* pg_dbms_lock_17* pgmemcache_17* \
    && \
    dnf clean all && \
    (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/* && \
    rm -f /etc/systemd/system/*.wants/* && \
    rm -f /lib/systemd/system/local-fs.target.wants/* && \
    rm -f /lib/systemd/system/sockets.target.wants/*udev* && \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl* && \
    rm -f /lib/systemd/system/basic.target.wants/* && \
    rm -f /lib/systemd/system/anaconda.target.wants/* && \
    localedef -i en_US -f UTF-8 en_US.UTF-8 && \
    localectl set-locale LANG=en_US.UTF-8 && \
    mkdir -p /www/pigsty && touch /www/pigsty/repo_complete \
    sed -i 's/^\(UsePAM yes\)/# \1/' /etc/ssh/sshd_config; \
    sed -i 's/^#\(PermitRootLogin\) .*/\1 yes/' /etc/ssh/sshd_config; \
    ssh-keygen -t rsa -f /root/.ssh/id_rsa -q -N "" && \
    cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys && \
    rm -f /run/nologin && \
    systemctl enable sshd

CMD ["/usr/sbin/init"]
