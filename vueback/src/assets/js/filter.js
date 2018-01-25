import Vue from 'vue'
export default (function () {
  Vue.filter('status', function (value) {
    if (value == 1) {
      return '启用'
    } else if (value == 0) {
      return '禁用'
    } else {
      return '未知状态'
    }
  })
  Vue.filter('push', function (value) {
    if (value == 1) {
      return '推送到Banner'
    } else if (value == 2) {
      return '推送到首页'
    } else if (value == 0) {
      return '不推送'
    } else {
      return '未知状态'
    }
  })
  Vue.filter('casePush', function (value) {
    if (value == 1) {
      return '轮播'
    } else if (value == 2) {
      return '右上'
    } else if (value == 3) {
      return '底部'
    } else {
      return '不推送'
    }
  })
  Vue.filter('rules', function (value) {
    return value
  })
  Vue.filter('fileLink', function (value) {
    const link = window.imgUrl + value
    return link
  })
  Vue.filter('toolType', function (value) {
    let type = ''
    if (value == 1) {
      type = '系统工具'
    } else if (value == 2) {
      type = '说明知道'
    }
    return type
  })
  Vue.filter('numToString', function (value) {
    const string = value.toString()
    return string
  })
  Vue.filter('projectState', function (value) {
    let string = ''
    switch (value) {
      case '1':
        string = '售前项目'
        break
      case '2':
        string = '服务中项目'
        break
      case '3':
        string = '已结束项目'
        break
    }
    return string
  })
  Vue.filter('time', function (value) {
    let day = moment.unix(value)
    let date = moment(day).format('YYYY/MM/DD H:mm')
    return date
  })
  Vue.filter('date', function (value) {
    let day = moment.unix(value)
    let date = moment(day).format('YYYY/MM/DD')
    return date
  })

  // Vue.filter('date', function (value) {
  //     var d = new Date(value);
  //     var year = d.getFullYear();
  //     var month = d.getMonth() + 1;
  //     var day = d.getDate() <10 ? '0' + d.getDate() : '' + d.getDate();
  //     var hour = d.getHours();
  //     var minutes = d.getMinutes();
  //     var seconds = d.getSeconds();
  //     return  year+ '-' + month + '-' + day + ' ' + hour + ':' + minutes + ':' + seconds;
  // })
  Vue.filter('abstract', function (value) {
    let abstract = ''
    if (value.length > 70) {
      abstract = value.substr(0, 70) + '...'
    } else {
      abstract = value
    }
    return abstract
  })
  Vue.filter('posStatus', function (value) {
    let status = ''
    switch (value) {
      case 1:
        status = '在职'
        break
      case 2:
        status = '待入职'
        break
      case 3:
        status = '离职'
        break
    }
    return status
  })
  Vue.filter('template', function (value) {
    let template = ''
    if (value == '') {
      template = '上传'
    } else {
      template = '上传更新'
    }
    return template
  })
})()
