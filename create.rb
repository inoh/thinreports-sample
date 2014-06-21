# coding: utf-8
require 'thinreports'

report = ThinReports::Report.create do
  # マルチレイアウト指定
  use_layout 'page1', :id => :page1
  use_layout 'page2', :id => :page2

  # １ページ目作成
  start_new_page :layout => :page1
  
  # ２ページ目作成
  start_new_page :layout => :page2 do |page|
    [:block1, :block2].each do |id|
      page.list(id) do |pays|
        pays.add_row :detail_text => 'detail_text1'
        pays.add_row :detail_text => 'detail_text2'
      end
    end
    # page.list(:block1).hide # １つ目のブロックを非表示
    # page.list(:block2).hide # ２つ目のブロックを非表示
  end  
end

report.generate(:filename => 'pdf/' + (ARGV[0] || 'output') + '.pdf')
