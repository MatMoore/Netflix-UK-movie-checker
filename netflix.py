'''Run netflix searches via Selenium'''
from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from getpass import getpass

def get_title(driver, title):
	'''Search for a title on netflix. Returns true if a result is found'''
	if title.startswith('the '):
		title = title[5:]
	if title.endswith(', the'):
		title = title[:-5]

	driver.get("http://www.netflix.co.uk")
	search = driver.find_element_by_id('searchField')
	search.send_keys(title)
	search.submit()

	xpath = "//*[@class='page-title'][starts-with(string(.), 'Results for')]"
	WebDriverWait(driver, 10).until(
			lambda driver: driver.find_element_by_xpath(xpath))

	titles = driver.find_elements_by_class_name('title')
	if not titles:
		raise Exception('No title classes')
	for result in titles:
		if result.text.find(title) != -1:
			return True
	return False

def login(driver, email, password):
	'''Login to netflix'''
	driver.get("https://signup.netflix.com/Login")
	driver.find_element_by_id('email').send_keys(email)
	entry = driver.find_element_by_id('password')
	entry.send_keys(password)
	entry.submit()
	WebDriverWait(driver, 10).until(
			lambda driver: driver.find_element_by_id('searchField'))

if __name__ == '__main__':
	# Look up a film
	import sys

	if len(sys.argv) != 3:
		sys.exit('Usage: email title')

	password = getpass()

	# Create a new instance of the Firefox driver
	d = webdriver.Firefox()

	try:
		login(d, sys.argv[1], password)
		print get_title(d, sys.argv[2])
	finally:
	    d.quit()
