// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
Rails.start()

import * as ActiveStorage from "@rails/activestorage"
import Turbolinks from "turbolinks"

import "channels"

Turbolinks.start()
ActiveStorage.start()

import "bootstrap"
import "bootstrap/dist/css/bootstrap.min.css"

import $ from 'jquery'
window.$ = $
window.jQuery = $
