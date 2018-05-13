namespace :category do
  namespace :category do
    desc '初始化Padagogy分类'
    task init_category: :environment do
      padagogy = %w[识记 分析 创造 应用 理解 评价]
      subject = %w[通用 教学 工具 自科 语文 数学 外语 社会 文艺]
      grade = %w[幼儿 小学 初中 高中 成人]

      padagogy.each do |item|
        PadagogyCategory.find_or_create_by!(name: item)
      end

      subject.each do |item|
        SubjectCategory.find_or_create_by!(name: item)
      end

      grade.each do |item|
        GradeCategory.find_or_create_by!(name: item)
      end

    end
  end
end
