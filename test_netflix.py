'''Nosetests to check Netflix coverage in the uk'''
from selenium import webdriver
import netflix
import nose
import sys
import codecs
from getpass import getpass

def test_coverage():
	'''Generate tests'''
	with codecs.open('movies', encoding='utf-8') as top250:
		for line in top250:
			yield check_exists, line.strip()

def check_exists(title):
	'''Test a movie exists on netflix'''
	assert netflix.get_title(driver, title)

if __name__ == '__main__':
	if len(sys.argv) != 2:
		sys.exit('Usage: python test_netflix.py email')

	password = getpass()

	try:
		driver = webdriver.Firefox()
		netflix.login(driver, sys.argv[1], password)
		nose.runmodule(argv=[__file__, '--with-xunit', '--nologcapture'])
	finally:
		driver.quit()
