# coding=utf-8

import sys
import os
from django.utils.translation import gettext_lazy as _
print os.path.dirname(os.path.dirname(os.path.abspath('__file__')))
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath('__file__'))))
try:
   from ENV import ENV
except Exception as e:
   ENV = ""
DIRNAME = os.path.dirname(__file__)

DEBUG = False
ALLOWED_HOSTS = ['139.196.176.216']
TEMPLATE_DEBUG = DEBUG

DEFAULT_FROM_EMAIL = 'your_email@domain.com'

ADMINS = (
    # ('Your Name', 'your_email@domain.com'),
)

MANAGERS = ADMINS

LANGUAGE_CODE = 'zh-Hans'

TIME_ZONE = 'Asia/Shanghai'
USE_I18N = True
USE_L10N = True
USE_TZ = True


LANGUAGES = (
    ('en', ('English')),
    ('zh_Hans', ('中文简体')),
)

LOCALE_PATHS = (
    os.path.join(DIRNAME, 'locale'),
)


if ENV == "TEST":
    DATABASES = {
        'default': {
            # Add 'postgresql_psycopg2', 'postgresql', 'mysql', 'sqlite3' or
            # 'oracle'.
            'ENGINE': 'django.db.backends.mysql',
            # Or path to database file if using sqlite3.
            'NAME': 'yunmengyanjindev',
            'USER': 'ymyjdev',  # Not used with sqlite3.
            'PASSWORD': 'Ymyjdev2016',  # Not used with sqlite3.
            # Set to empty string for localhost. Not used with sqlite3.
            'HOST': 'rm-uf60of4wvveu082pq.mysql.rds.aliyuncs.com',
            # Set to empty string for default. Not used with sqlite3.
            'PORT': '3306',
        }
    }
elif ENV == "PRODUCTION":
    DATABASES = {
        'default': {
            # Add 'postgresql_psycopg2', 'postgresql', 'mysql', 'sqlite3' or
            # 'oracle'.
            'ENGINE': 'django.db.backends.mysql',
            # Or path to database file if using sqlite3.
            'NAME': 'yunmengyanjin',
            'USER': 'yunmengyanjin',  # Not used with sqlite3.
            'PASSWORD': 'Yunmengyanjin2016',  # Not used with sqlite3.
            # Set to empty string for localhost. Not used with sqlite3.
            'HOST': 'rm-uf60of4wvveu082pq.mysql.rds.aliyuncs.com',
            # Set to empty string for default. Not used with sqlite3.
            'PORT': '3306',
        }
    }
else:
    DATABASES = {
        'default': {
            # Add 'postgresql_psycopg2', 'postgresql', 'mysql', 'sqlite3' or
            # 'oracle'.
            'ENGINE': 'django.db.backends.mysql',
            # Or path to database file if using sqlite3.
            'NAME': 'test_yunmengyanjin',
            'USER': 'root',  # Not used with sqlite3.
            'PASSWORD': 'yunmengyanjin',  # Not used with sqlite3.
            # Set to empty string for localhost. Not used with sqlite3.
            'HOST': '127.0.0.1',
            # Set to empty string for default. Not used with sqlite3.
            'PORT': '3306',
        }
    }

# Local time zone for this installation. Choices can be found here:
# http://en.wikipedia.org/wiki/List_of_tz_zones_by_name
# although not all choices may be available on all operating systems.
# If running in a Windows environment this must be set to the same as your
# system time zone.


# Language code for this installation. All choices can be found here:
# http://www.i18nguy.com/unicode/language-identifiers.html


SITE_ID = 1

# If you set this to False, Django will make some optimizations so as not
# to load the internationalization machinery.


# media files settings
MEDIA_URL = '/media/'
MEDIA_ROOT = "/home/lyf1999/ymyjdev/media/"

# static files settings
STATIC_URL = '/static/'
STATIC_ROOT = "/home/lyf1999/ymyjdev/sitestatic/"

# Make this unique, and don't share it with anybody.
SECRET_KEY = '+0zsw5n@v7*rhl6r6ufqhoc6jlqq0f-u8c+gh(hjb+_jmg@rh6'

STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
    'compressor.finders.CompressorFinder',
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.locale.LocaleMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    "django.contrib.redirects.middleware.RedirectFallbackMiddleware",
    "pagination.middleware.PaginationMiddleware",

)

ROOT_URLCONF = 'urls'

SESSION_SERIALIZER = "django.contrib.sessions.serializers.PickleSerializer"

INSTALLED_APPS = (
    'lfs_theme',
    'compressor',
    "django.contrib.admin",
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.staticfiles',
    'django.contrib.sites',
    'django.contrib.flatpages',
    'django.contrib.redirects',
    'django.contrib.sitemaps',
    'django_countries',
    'pagination',
    'reviews',
    'portlets',
    'lfs.addresses',
    'lfs.caching',
    'lfs.cart',
    'lfs.catalog',
    'lfs.checkout',
    'lfs.core',
    'lfs.criteria',
    'lfs.customer',
    'lfs.customer_tax',
    'lfs.discounts',
    'lfs.export',
    'lfs.gross_price',
    'lfs.mail',
    'lfs.manage',
    'lfs.marketing',
    'lfs.manufacturer',
    'lfs.net_price',
    'lfs.order',
    'lfs.page',
    'lfs.payment',
    'lfs.portlet',
    'lfs.search',
    'lfs.shipping',
    'lfs.supplier',
    'lfs.tax',
    'lfs.tests',
    'lfs.utils',
    'lfs.voucher',
    'lfs_contact',
    'lfs_order_numbers',
    'localflavor',
    'postal',
    'paypal.standard.ipn',
    'paypal.standard.pdt',
)

FORCE_SCRIPT_NAME = ""

LOGIN_URL = "/login/"
LOGIN_REDIRECT_URL = "/manage/"

TEMPLATE_CONTEXT_PROCESSORS = (
    'django.contrib.auth.context_processors.auth',
    'django.core.context_processors.i18n',
    'django.core.context_processors.request',
    'django.core.context_processors.media',
    'django.core.context_processors.static',
    'lfs.core.context_processors.main',

)

AUTHENTICATION_BACKENDS = (
    'lfs.customer.auth.EmailBackend',
    'django.contrib.auth.backends.ModelBackend',
)

CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.dummy.DummyCache',
        'KEY_PREFIX': 'lfs'
    }
}

EMAIL_HOST = ""
EMAIL_HOST_USER = ""
EMAIL_HOST_PASSWORD = ""

PAYPAL_RECEIVER_EMAIL = "info@yourbusiness.com"
PAYPAL_IDENTITY_TOKEN = "set_this_to_your_paypal_pdt_identity_token"

LFS_PAYPAL_REDIRECT = True
LFS_AFTER_ADD_TO_CART = "lfs_added_to_cart"
LFS_RECENT_PRODUCTS_LIMIT = 5

LFS_LOCALE = "en_US.UTF-8"

LFS_ORDER_NUMBER_GENERATOR = "lfs_order_numbers.models.OrderNumberGenerator"
LFS_DOCS = "http://docs.getlfs.com/en/latest/"

LFS_INVOICE_COMPANY_NAME_REQUIRED = False
LFS_INVOICE_EMAIL_REQUIRED = True
LFS_INVOICE_PHONE_REQUIRED = True

LFS_SHIPPING_COMPANY_NAME_REQUIRED = False
LFS_SHIPPING_EMAIL_REQUIRED = False
LFS_SHIPPING_PHONE_REQUIRED = False

LFS_PAYMENT_METHOD_PROCESSORS = [
    ["lfs_paypal.PayPalProcessor", _(u"PayPal")],
]

LFS_PRICE_CALCULATORS = [
    ['lfs.gross_price.GrossPriceCalculator', _(u'Price includes tax')],
    ['lfs.net_price.NetPriceCalculator', _(u'Price excludes tax')],
]

LFS_SHIPPING_METHOD_PRICE_CALCULATORS = [
    ["lfs.shipping.GrossShippingMethodPriceCalculator", _(u'Price includes tax')],
    ["lfs.shipping.NetShippingMethodPriceCalculator", _(u'Price excludes tax')],
]

LFS_UNITS = [
    u"l",
    u"m",
    u"qm",
    u"cm",
    u"lfm",
    u"Package",
    u"Piece",
]

LFS_PRICE_UNITS = LFS_BASE_PRICE_UNITS = LFS_PACKING_UNITS = LFS_UNITS

LFS_CRITERIA = [
    ["lfs.criteria.models.CartPriceCriterion", _(u"Cart Price")],
    ["lfs.criteria.models.CombinedLengthAndGirthCriterion", _(u"Combined Length and Girth")],
    ["lfs.criteria.models.CountryCriterion", _(u"Country")],
    ["lfs.criteria.models.HeightCriterion", _(u"Height")],
    ["lfs.criteria.models.LengthCriterion", _(u"Length")],
    ["lfs.criteria.models.WidthCriterion", _(u"Width")],
    ["lfs.criteria.models.WeightCriterion", _(u"Weight")],
    ["lfs.criteria.models.ShippingMethodCriterion", _(u"Shipping Method")],
    ["lfs.criteria.models.PaymentMethodCriterion", _(u"Payment Method")],

]

REVIEWS_SHOW_PREVIEW = False
REVIEWS_IS_NAME_REQUIRED = False
REVIEWS_IS_EMAIL_REQUIRED = False
REVIEWS_IS_MODERATED = False

LOGGING = {
    "version": 1,
    "formatters": {
        "verbose": {
            "format": "%(asctime)s %(levelname)s %(message)s",
            "datefmt": "%a, %d %b %Y %H:%M:%S",
        },
    },
    "handlers": {
        "console": {
            "level": "DEBUG",
            "class": "logging.StreamHandler",
            "formatter": "verbose",
        },
        'logfile': {
            'level': 'DEBUG',
            'class': 'logging.handlers.RotatingFileHandler',
            'formatter': 'verbose',
            'filename': os.path.join(DIRNAME, "..", "lfs.log"),
            'mode': 'a',
        },
    },
    "loggers": {
        "default": {
            "handlers": ["logfile", "console"],
            "level": "DEBUG",
            "propagate": False,
        },
    }
}

try:
    from local_settings import *
except ImportError:
    pass
