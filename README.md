# Whois_parser
Script which parses list of domains from google spreadsheet and gets whois info to each domain
### Installation
1. Download [whois_parser.zip](https://github.com/andyvesel/whois_parser/archive/master.zip)
2. Install gems with Bundler
```
$ bundle install
```
### How to use
- Unzip archive and go to proper directory
```
$ unzip master.zip
```
```
$ cd whois_parser
```
- Fill in a "Website" column in your google spreadsheet

**Notice**: On first launch google_drive gem creates a session. 
This will prompt the credential via command line for the first time and save it to config.json file for later usages.

- Run `ruby parser.rb` in your terminal. Follow the link and copy authorization code, shown in the browser page. 

- Enter this code in your console.

- Check your google file

## Supported environments
Checked with Ruby 2.0.0 and 2.2.3