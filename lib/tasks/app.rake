namespace :app do
  require 'spreadsheet'
  namespace :apps do
    desc '根据Excel初始化App列表'
    task init_from_excel: :environment do
      Spreadsheet.client_encoding = 'UTF-8'

      book  = Spreadsheet.open("#{Rails.root}/public/#{ENV['FILE_NAME']}")

      book.worksheets.each_with_index do |sheet, sheet_index|
        padagogy_category_id = PadagogyCategory.find_by(name: sheet.name).id
        sheet.each_with_index do |row, row_index|
          name = row[0].to_s
          logo = row[1].to_s
          qr_code = row[2].to_s
          size = row[3].to_s
          company = row[4].to_s
          describe = row[5]
          subject_category_id = SubjectCategory.ids.sample
          grade_category_id = GradeCategory.ids.sample

          App.create!(name: name,
                      logo: logo,
                      qr_code: qr_code,
                      size: size,
                      company: company,
                      describe: describe,
                      padagogy_category_id: padagogy_category_id,
                      subject_category_id: subject_category_id,
                      grade_category_id: grade_category_id)
          puts name
        end
      end
    end
  end
end
