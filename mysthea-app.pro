TEMPLATE = subdirs

# Fixes build on Windows
CONFIG += resources_big

SUBDIRS += src

!no-tests {
    SUBDIRS += tests
}
