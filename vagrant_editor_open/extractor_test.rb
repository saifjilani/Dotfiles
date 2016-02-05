require "minitest/autorun"
require_relative "extractor"

class ExtractorTest < MiniTest::Test
  def test_1
    argv = ["modified:   test/functional/admin/", "products_controller_test.rb"]

    assert_equal "test/functional/admin/products_controller_test.rb", Extractor.extract_path(argv)
  end

  def test_2
    argv = [" Actual: 200  (actionpack-4.2.5.1)    lib/action_dispatch/testing/assertions/response.rb:36 in `assert_response`       test/functional/admin/products_co",
            "ntroller_test.rb:23"]

    assert_equal "test/functional/admin/products_controller_test.rb:23", Extractor.extract_path(argv)
  end

  def test_returns_nil_if_not_a_valid_file
    argv = ["autoprefixer: /home/vagrant/src/shopify/app/assets/stylesheets/signup/signup.scss:6160:3: You should write display: flex by final spec instead of display: box",
            "FAIL[\"test_:index_should_respond_to_html_request\", Admin::ProductsControllerHTMLTest, 2016-01-28 15:01:06 +0000]"]

    assert_equal nil, Extractor.extract_path(argv)
  end

  def test_accepts_extra_args
    #iTerm might send some extra args just because we can
    argv = ["(use \"git add <file>...\" to update what will be committed)          (use \"git checkout -- <file>...\" to discard changes in working directory)",
            "modified:   test/functional/admin/",
            "products_controller_test.rb"]

    assert_equal "test/functional/admin/products_controller_test.rb", Extractor.extract_path(argv)
  end

  def test_accept_multiple_lines_of_ruby_files
    argv = ["[vagrant] ~/src/shopify (backfill_orders_to_create_marketing_attribution)    gd --cached    [vagrant] ~/src/shopify (backfill_orders_to_create_marketing_attribution)   gs    On branch backfill_orders_to_create_marketing_attribution   Changes to be committed:\"git reset HEAD <file>...\" to unstage)",
            "modified:   app/models/marketing_attribution.rb    ",
            "modified:   db/maintenance/maint",
            "enance/backfill_marketing_attribution_from_orders_task.rb       1 maintenance task to backfill marketing attribution using data from order.landing_site   ",
            "modified:   test/unit/maintenance/backfill_test.rb           [vagrant] ~/src/shopify   "]

    argv = ["[vagrant] ~/src/shopify (backfill_orders_to_create_marketing_attribution)     gd --cached                                    [vagrant] ~/src/shopify (backfill_orders_to_create_marketing_attribution)         On branch backfill_orders_to_create_marketing_attribution      Changes to be committed:       (use \"git reset HEAD <file>...\" to unstage)     ",
            "modified:   app/models/marketing_attribution.rb                                         ",
            "modified:   db/maintenance/maintenance/backfill_marke",
            "ting_attribution_from_orders_task.rb                                                   1 maintenance task to backfill marketing attribution using data from order.landing_site       ",
            "modified:   test/unit/maintenance/backfill_marketing_attribution_from_orders_task_test.rb                                                 [vagrant] ~/src/shopify (backfill_orders_to_create_marketing_attribution)     usage: git [--version] [--help] [-C <path>] [-c name=value]           [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]"]

    assert_equal "db/maintenance/maintenance/backfill_marketing_attribution_from_orders_task.rb", Extractor.extract_path(argv)
  end
end
