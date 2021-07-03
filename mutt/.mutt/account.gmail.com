source ~/.mutt/password.gmail.com
set folder = "imaps://imap.gmail.com:993"
set spoolfile = "+INBOX"
set imap_keepalive = 900
set from = "polyakovskiy.ilya@gmail.com"
set smtp_url = smtp://$imap_user@smtp.gmail.com:587
set smtp_pass = $imap_pass                                    
set postponed = "+[Gmail]/Drafts"                             
set record = "+[Gmail]/Sent Mail"
set header_cache = ~/.mutt/gmail.com/cache/
set message_cachedir = ~/.mutt/gmail.com/cache/
