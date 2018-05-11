namespace :app do
  require 'spreadsheet'
  namespace :apps do
    desc '根据Excel初始化App列表'
    task init_from_excel: :environment do
      Spreadsheet.client_encoding = 'UTF-8'

      book  = Spreadsheet.open("#{Rails.root}/public/#{ENV['FILE_NAME']}")
      sheet = book.worksheet(0)

      sheet.each_with_index do |row, index|
        name = row[0].to_s
        logo = row[1].to_s
        qr_code = row[2].to_s
        size = row[3].to_s
        company = row[4].to_s
        describe = row[5]

        App.create!(name: name, logo: logo, qr_code: qr_code, size: size, company: company, describe: describe)
      end
    end
  end
end
