import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  var filter = new Vue({
    el: '.category-panel',
    data: {
      message: 'category',
      categoriesList: {},
      selectedCategoryId: {
        'padagogyCategory': [],
        'subjectCategory': [],
        'gradeCategory': []
      }
    },

    methods: {
      filterApps: function () {
        console.log('Start Filter Apps');
        var _self = this;
        var params = {
          'padagogy': _self.selectedCategoryId.padagogyCategory,
          'subject': _self.selectedCategoryId.subjectCategory,
          'grade': _self.selectedCategoryId.gradeCategory
        }
        $.ajax({
          url:'apps/apps_category',
          headers: {'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')},
          type: 'POST',
          data: params,
          success: function(res) {
            appsList._data.appsList = res.data;
          }
        });
      },
      selectedCategory: function (categoryFlag, categoryId) {
        var _self = this;
        console.log(categoryId);
        if(_self.selectedCategoryId[categoryFlag].includes(categoryId)) {
          _self.selectedCategoryId[categoryFlag].remove(categoryId)
        }
        else {
          _self.selectedCategoryId[categoryFlag].push(categoryId);
        }

        setTimeout(function(){ _self.filterApps() }, 1000);
      },
      showCategoriesList: function () {
        var _self = this;
        $.ajax({
          url: 'apps/category',
          headers: {'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')},
          type: 'GET',
          data: '',
          success: function(res) {
            _self.categoriesList = res.data;
          }
        });
      }
    },
    mounted() {
      this.showCategoriesList();
    }
  });

  var appsList = new Vue({
    el: '.app-lists',
    data: {
      message: 'Hello Vue',
      appsList: {}
    },

    methods: {
      showAppsList: function (params = '') {
        var _self = this;
        $.ajax({
          url: '/apps/apps_category',
          headers: {'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')},
          type: 'POST',
          data: params,
          success: function(res) {
            _self.appsList = res.data
          }
        })
      }
    },

    mounted() {
      this.showAppsList();
    }
  });

})

Array.prototype.indexOf = function(val) {
  for (var i = 0; i < this.length; i++) {
    if (this[i] == val) return i;
  }
  return -1;
};

Array.prototype.remove = function(val) {
  var index = this.indexOf(val);
  if (index > -1) {
    this.splice(index, 1);
  }
};


