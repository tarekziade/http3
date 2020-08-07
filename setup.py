# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this file,
# You can obtain one at http://mozilla.org/MPL/2.0/.

from __future__ import absolute_import

from setuptools import setup

PACKAGE_NAME = "mozhttp3server"
PACKAGE_VERSION = "0.1"

deps = ["aioquic", "aiofiles", "asgiref", "dnslib", "httpbin", "starlette", "uvloop", "wsproto"]

setup(
    name=PACKAGE_NAME,
    version=PACKAGE_VERSION,
    description="Mozilla's HTTP3 testing server",
    classifiers=["Programming Language :: Python :: 3.6"],
    keywords="",
    author="Mozilla Performance Test Engineering Team",
    author_email="tools@lists.mozilla.org",
    url="https://hg.mozilla.org/mozilla-central/file/tip/python/mozhttp3server",
    license="MPL",
    packages=["mozhttp3server"],
    include_package_data=True,
    zip_safe=False,
    install_requires=deps,
)
