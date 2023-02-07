cd /root/mainnet/docs/
 mkdocs build && rm -rf /home/gsys_docs/site && cp -avr /root/mainnet/docs/site /home/gsys_docs && chcon -Rt httpd_sys_content_t /home/gsys_docs