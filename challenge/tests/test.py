import time
from selenium.webdriver import Chrome
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import parse

URL = "http://127.0.0.1:8000/"

opts = Options()
#opts.set_headless()
#assert opts.headless

browser = Chrome(options=opts)
browser.get(URL)

buttons = browser.find_elements_by_class_name('button')

new_visitor = buttons[0]
new_visitor.click()

text = browser.find_elements_by_class_name('create-enter-text')[0].text

username_grabber = "{}Ex: {username}"
parse_res = parse.parse(username_grabber, text)
username = parse_res['username']

text_box = browser.find_element(By.ID, 'name')
text_box.send_keys(username)
text_box.send_keys(Keys.ENTER)

next_indeces = [2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0]

for index in next_indeces:
    button = browser.find_elements_by_class_name('button')[index]
    button.click()

time.sleep(2)
browser.close()
