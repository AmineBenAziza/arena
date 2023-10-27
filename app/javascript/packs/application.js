// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import 'bootstrap'
import '../stylesheets/application'
import "@fortawesome/fontawesome-free/js/all"

require("jquery")
require("@nathanvda/cocoon")

Rails.start()
Turbolinks.start()
ActiveStorage.start()
$(document).on('turbolinks:load', function() {
  $(document).ready(function() {
    $('#select_fighter_1').on('change', function() {
      var selectedValue = $(this).val();
      $.ajax({
        url: "http://localhost:3000/fighters",
        method: 'GET',
        data: { id: selectedValue },
        success: function(response) {
          // Clear existing options
          let selected_0 = $('#select_fighter_0').val()
          $('#select_fighter_0').find('option').remove();
          $('#select_fighter_0').append($('<option>', {
            value: "",
            text: "Choisir Votre Combattant"
          }));
          // Append new options based on the response
          $.each(response, function(index, option) {
            $('#select_fighter_0').append($('<option>', {
              value: option[0],
              text: option[1]
            }));
          });
          $('#select_fighter_0').val(selected_0)
        },
        error: function(error) {
          console.log(error);
        }
      });
    });
  });
  $(document).ready(function() {
    $('#select_fighter_0').on('change', function() {
      var selectedValue = $(this).val();
      $.ajax({
        url: "http://localhost:3000/fighters",
        method: 'GET',
        data: { id: selectedValue },
        success: function(response) {
          let selected_1 = $('#select_fighter_1').val()
          // Clear existing options
          $('#select_fighter_1').find('option').remove();
          $('#select_fighter_1').append($('<option>', {
            value: "",
            text: "Choisir Votre Combattant"
          }));
          // Append new options based on the response
          $.each(response, function(index, option) {
            $('#select_fighter_1').append($('<option>', {
              value: option[0],
              text: option[1]
            }));
          });
          $('#select_fighter_1').val(selected_1)
        },
        error: function(error) {
          console.log(error);
        }
      });
    });
  });
})


