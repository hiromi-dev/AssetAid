SOURCE_DIR ?= /default/source/dir
PHOTOS_DIR_NAME ?= default_photos_dir

# ex: make unzip_photos SOURCE_DIR=/custom/source/dir PHOTOS_DIR_NAME=custom_photos_dir
unzip_photos:
	@./unzip.sh "$(SOURCE_DIR)" "$(PHOTOS_DIR_NAME)"

IMAGE_FOLDER ?= /default/image/folder
OUTPUT_FOLDER ?= /default/output/folder

# ex: make resize_images IMAGE_FOLDER=/custom/image/folder OUTPUT_FOLDER=/custom/output/folder
resize_images:
	@./resize.sh "$(IMAGE_FOLDER)" "$(OUTPUT_FOLDER)"
