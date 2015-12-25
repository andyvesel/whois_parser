require 'socket'

session = GoogleDrive.saved_session("config.json")
ws = session.spreadsheet_by_key("1ylT3Wj7WpB2jkwarCvbHoIeM-lQvmBaSN9WjkTp2uw4").worksheets[0]

DOMAIN_REGEX = /^[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9]\.[a-zA-Z]{2,}$/

ws.rows.each_with_index do |row, i|
  domain_name = row.first
  next unless domain_name.match(DOMAIN_REGEX)

  query = Whois.whois(domain_name)
  ip = IPSocket::getaddress(domain_name)
  query = Whois.whois(domain_name)

  begin
    if i > 0
      i += 1
      ws[i, 2] = query.created_on
      ws[i, 3] = query.expires_on
      ws[i, 4] = query.admin_contact.to_a[4..9].join(' ') # address
      ws[i, 5] = query.admin_contact.to_a[10].to_s # phone
      ws[i, 6] = query.admin_contact[12] # email
      ws[i, 7] = query.nameservers.join(' ')
      ws[i, 8] = ip
      ws.save
    end
  rescue
    puts "#{domain_name} didn't resolve, please try again"
  end
end