# Whois_parser
Script which parses list of domains from google spreadsheet and gets whois info to each domain
### Installation
1. Download [whois_parser.zip](https://github.com/andyvesel/whois_parser/archive/master.zip)
2. Install gems
```
$ sudo gem install whois
```
```
$ sudo gem install google_drive
```
### How to use
Unzip archive, go to directory and launch the file in your terminal
```
$ unzip master.zip
```
```
$ cd whois_parser
```
```
$ ruby parser.rb
```
On first launch you'll see a google link in console.
* Follow the link and copy authorization code, shown in the page. 
* Then enter this code in your console.