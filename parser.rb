require 'rubygems'
require 'whois'
require "google/api_client"
require "google_drive"

# created_on
# expires_on
# nameservers
# contacts

session = GoogleDrive.saved_session("config.json")
ws = session.spreadsheet_by_key("1ylT3Wj7WpB2jkwarCvbHoIeM-lQvmBaSN9WjkTp2uw4").worksheets[0]

DOMAIN_REGEX = /^[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9]\.[a-zA-Z]{2,}$/

ws.rows.each do |row|
  domain_name = row.first
  next unless domain_name.match(DOMAIN_REGEX)

  def process_domain(domain_name)
    @query = Whois.whois(domain_name)
      puts @query.nameservers
  end
  process_domain(domain_name)
  ws[1, 2] = @query.created_on
  ws.save
end

# x = Whois::Client.new
# q = x.lookup('')

