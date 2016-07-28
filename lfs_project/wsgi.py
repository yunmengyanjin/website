import os

from os.path import join,dirname,abspath
 
PROJECT_DIR = dirname(dirname(abspath(__file__)))#3
import sys # 4
sys.path[0:0] = [
  '/home/lyf1999',
  '/home/lyf1999/website/eggs/django_lfs-0.10.2-py2.7.egg',
  '/home/lyf1999/website/eggs/djangorecipe-1.9-py2.7.egg',
  '/home/lyf1999/website/eggs/Django-1.8-py2.7.egg',
  '/home/lyf1999/website/eggs/zc.recipe.egg-2.0.3-py2.7.egg',
  '/home/lyf1999/website/eggs/zc.buildout-2.5.1-py2.7.egg',
  '/home/lyf1999/website/eggs/Pillow-3.3.0-py2.7-linux-x86_64.egg',
  '/home/lyf1999/website/eggs/lfs_theme-0.10.1-py2.7.egg',
  '/home/lyf1999/website/eggs/lfs_paypal-1.3-py2.7.egg',
  '/home/lyf1999/website/eggs/lfs_order_numbers-1.1-py2.7.egg',
  '/home/lyf1999/website/eggs/lfs_contact-1.2-py2.7.egg',
  '/home/lyf1999/website/eggs/django_reviews-1.1-py2.7.egg',
  '/home/lyf1999/website/eggs/django_postal-0.96-py2.7.egg',
  '/home/lyf1999/website/eggs/django_portlets-1.3-py2.7.egg',
  '/home/lyf1999/website/eggs/django_pagination-1.0.7-py2.7.egg',
  '/home/lyf1999/website/eggs/django_paypal-0.1.2.lfs_2-py2.7.egg',
  '/home/lyf1999/website/eggs/django_localflavor-1.1-py2.7.egg',
  '/home/lyf1999/website/eggs/django_compressor-2.0-py2.7.egg',
  '/home/lyf1999/website/eggs/setuptools-21.0.0-py2.7.egg',
  '/home/lyf1999/website/eggs/django_countries-3.4.1-py2.7.egg',
  '/home/lyf1999/website/eggs/six-1.10.0-py2.7.egg',
  '/home/lyf1999/website/eggs/django_appconf-1.0.2-py2.7.egg',
  '/home/lyf1999/website',
  '/home/lyf1999/website/lfs_project',
  ]

os.environ["DJANGO_SETTINGS_MODULE"] = "lfs_project.settings"

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()





