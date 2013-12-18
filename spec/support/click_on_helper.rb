module ClickOnHelper

  #
  # Examples
  #
  #   click_on '.new_foo'   # <a href='#' class='new_foo'>foo</a>
  #   click_on '#save_foo'  # <a href='#' id='save_foo'>foo</a>
  #   click_on ':#save_foo' # <a href='#save_foo'>foo</a>
  #   click_on '/some/url'  # <a href='/some/url'>foo</a>
  #   click_on '+ New Foo'  # <a href='#'>+ New Foo</a>
  #
  def click_on(locator)
    el = case locator[0]
         when ':'
           val = locator[1..-1]

           find %(a[href="#{val}"])

         when '.', '#'
           find locator

         else
           if locator =~ /\//
            find %(a[href="#{locator}"])

           else
             nil
           end
         end

    if el
      el.click

    else
      super locator
    end

  rescue Capybara::ElementNotFound, Nokogiri::CSS::SyntaxError
    super locator
  end
end
