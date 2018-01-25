import Login from './components/Account/Login.vue'
import refresh from './components/refresh.vue'
import Home from './components/Home.vue'
import menuList from './components/Administrative/system/menu/list.vue'
import menuAdd from './components/Administrative/system/menu/add.vue'
import menuEdit from './components/Administrative/system/menu/edit.vue'
import systemConfig from './components/Administrative/system/config/add.vue'
import ruleList from './components/Administrative/system/rule/list.vue'
import ruleAdd from './components/Administrative/system/rule/add.vue'
import ruleEdit from './components/Administrative/system/rule/edit.vue'
import positionList from './components/Administrative/structures/position/list.vue'
import positionAdd from './components/Administrative/structures/position/add.vue'
import positionEdit from './components/Administrative/structures/position/edit.vue'
import structuresList from './components/Administrative/structures/structures/list.vue'
import structuresAdd from './components/Administrative/structures/structures/add.vue'
import structuresEdit from './components/Administrative/structures/structures/edit.vue'
import groupsList from './components/Administrative/structures/groups/list.vue'
import groupsAdd from './components/Administrative/structures/groups/add.vue'
import groupsEdit from './components/Administrative/structures/groups/edit.vue'
import usersList from './components/Administrative/personnel/users/list.vue'
import usersAdd from './components/Administrative/personnel/users/add.vue'
import usersEdit from './components/Administrative/personnel/users/edit.vue'
import productList from './components/Administrative/category/product/list.vue'
import productAdd from './components/Administrative/category/product/add.vue'
import productEdit from './components/Administrative/category/product/edit.vue'
import brandList from './components/Administrative/category/brand/list.vue'
import brandAdd from './components/Administrative/category/brand/add.vue'
import brandEdit from './components/Administrative/category/brand/edit.vue'
import serviceList from './components/Administrative/category/service/list.vue'
import serviceAdd from './components/Administrative/category/service/add.vue'
import serviceEdit from './components/Administrative/category/service/edit.vue'
import newsList from './components/Administrative/category/news/list.vue'
import newsAdd from './components/Administrative/category/news/add.vue'
import newsEdit from './components/Administrative/category/news/edit.vue'
import contactList from './components/Administrative/category/contact/list.vue'
import contactAdd from './components/Administrative/category/contact/add.vue'
import contactEdit from './components/Administrative/category/contact/edit.vue'
import shouyeList from './components/Administrative/other/shouye/list.vue'
import shouyeAdd from './components/Administrative/other/shouye/add.vue'
import shouyeEdit from './components/Administrative/other/shouye/edit.vue'
import friendList from './components/Administrative/other/friend/list.vue'
import friendAdd from './components/Administrative/other/friend/add.vue'
import friendEdit from './components/Administrative/other/friend/edit.vue'
import mysqlsList from './components/Administrative/other/mysqls/list.vue'
import measureList from './components/Administrative/other/measure/list.vue'
import joinsList from './components/Administrative/category/joins/list.vue'
import joinsAdd from './components/Administrative/category/joins/add.vue'
import joinsEdit from './components/Administrative/category/joins/edit.vue'

/**
 * meta参数解析
 * hideLeft: 是否隐藏左侧菜单，单页菜单为true
 * module: 菜单所属模块
 * menu: 所属菜单，用于判断三级菜单是否显示高亮，如菜单列表、添加菜单、编辑菜单都是'menu'，用户列表、添加用户、编辑用户都是'user'，如此类推
 */

const routes = [
  { path: '/', component: Login, name: 'Login' },
  {
    path: '/home',
    component: Home,
    children: [
      { path: '/refresh', component: refresh, name: 'refresh' }
    ]
  },

  {
    path: '/home',
    component: Home,
    children: [
      { path: 'menu/list', component: menuList, name: 'menuList', meta: { hideLeft: false, module: 'Administrative', menu: 'menu' }},
      { path: 'menu/add', component: menuAdd, name: 'menuAdd', meta: { hideLeft: false, module: 'Administrative', menu: 'menu' }},
      { path: 'menu/edit/:id', component: menuEdit, name: 'menuEdit', meta: { hideLeft: false, module: 'Administrative', menu: 'menu' }}
    ]
  },
  {
    path: '/home',
    component: Home,
    children: [
      { path: 'config/add', component: systemConfig, name: 'systemConfig', meta: { hideLeft: false, module: 'Administrative', menu: 'systemConfig' }}
    ]
  },
  {
    path: '/home',
    component: Home,
    children: [
      { path: 'rule/list', component: ruleList, name: 'ruleList', meta: { hideLeft: false, module: 'Administrative', menu: 'rule' }},
      { path: 'rule/add', component: ruleAdd, name: 'ruleAdd', meta: { hideLeft: false, module: 'Administrative', menu: 'rule' }},
      { path: 'rule/edit/:id', component: ruleEdit, name: 'ruleEdit', meta: { hideLeft: false, module: 'Administrative', menu: 'rule' }}
    ]
  },
  {
    path: '/home',
    component: Home,
    children: [
      { path: 'position/list', component: positionList, name: 'positionList', meta: { hideLeft: false, module: 'Administrative', menu: 'position' }},
      { path: 'position/add', component: positionAdd, name: 'positionAdd', meta: { hideLeft: false, module: 'Administrative', menu: 'position' }},
      { path: 'position/edit/:id', component: positionEdit, name: 'positionEdit', meta: { hideLeft: false, module: 'Administrative', menu: 'position' }}
    ]
  },
  {
    path: '/home',
    component: Home,
    children: [
      { path: 'structures/list', component: structuresList, name: 'structuresList', meta: { hideLeft: false, module: 'Administrative', menu: 'structures' }},
      { path: 'structures/add', component: structuresAdd, name: 'structuresAdd', meta: { hideLeft: false, module: 'Administrative', menu: 'structures' }},
      { path: 'structures/edit/:id', component: structuresEdit, name: 'structuresEdit', meta: { hideLeft: false, module: 'Administrative', menu: 'structures' }}
    ]
  },
  {
    path: '/home',
    component: Home,
    children: [
      { path: 'groups/list', component: groupsList, name: 'groupsList', meta: { hideLeft: false, module: 'Administrative', menu: 'groups' }},
      { path: 'groups/add', component: groupsAdd, name: 'groupsAdd', meta: { hideLeft: false, module: 'Administrative', menu: 'groups' }},
      { path: 'groups/edit/:id', component: groupsEdit, name: 'groupsEdit', meta: { hideLeft: false, module: 'Administrative', menu: 'groups' }}
    ]
  },
  {
    path: '/home',
    component: Home,
    children: [
      { path: 'users/list', component: usersList, name: 'usersList', meta: { hideLeft: false, module: 'Administrative', menu: 'users' }},
      { path: 'users/add', component: usersAdd, name: 'usersAdd', meta: { hideLeft: false, module: 'Administrative', menu: 'users' }},
      { path: 'users/edit/:id', component: usersEdit, name: 'usersEdit', meta: { hideLeft: false, module: 'Administrative', menu: 'users' }}
    ]
  },
  {
    path: '/home',
    component: Home,
    children: [
      { path: 'product/list', component: productList, name: 'productList', meta: { hideLeft: false, module: 'Administrative', menu: 'product' }},
      { path: 'product/add', component: productAdd, name: 'productAdd', meta: { hideLeft: false, module: 'Administrative', menu: 'product' }},
      { path: 'product/edit/:id', component: productEdit, name: 'productEdit', meta: { hideLeft: false, module: 'Administrative', menu: 'product' }}
    ]
  },
  {
    path: '/home',
    component: Home,
    children: [
      { path: 'brand/list', component: brandList, name: 'brandList', meta: { hideLeft: false, module: 'Administrative', menu: 'brand' }},
      { path: 'brand/add', component: brandAdd, name: 'brandAdd', meta: { hideLeft: false, module: 'Administrative', menu: 'brand' }},
      { path: 'brand/edit/:id', component: brandEdit, name: 'brandEdit', meta: { hideLeft: false, module: 'Administrative', menu: 'brand' }}
    ]
  },
  {
    path: '/home',
    component: Home,
    children: [
      { path: 'service/list', component: serviceList, name: 'serviceList', meta: { hideLeft: false, module: 'Administrative', menu: 'service' }},
      { path: 'service/add', component: serviceAdd, name: 'serviceAdd', meta: { hideLeft: false, module: 'Administrative', menu: 'service' }},
      { path: 'service/edit/:id', component: serviceEdit, name: 'serviceEdit', meta: { hideLeft: false, module: 'Administrative', menu: 'service' }}
    ]
  },
  {
    path: '/home',
    component: Home,
    children: [
      { path: 'news/list', component: newsList, name: 'newsList', meta: { hideLeft: false, module: 'Administrative', menu: 'news' }},
      { path: 'news/add', component: newsAdd, name: 'newsAdd', meta: { hideLeft: false, module: 'Administrative', menu: 'news' }},
      { path: 'news/edit/:id', component: newsEdit, name: 'newsEdit', meta: { hideLeft: false, module: 'Administrative', menu: 'news' }}
    ]
  },
  {
    path: '/home',
    component: Home,
    children: [
      { path: 'contact/list', component: contactList, name: 'contactList', meta: { hideLeft: false, module: 'Administrative', menu: 'contact' }},
      { path: 'contact/add', component: contactAdd, name: 'contactAdd', meta: { hideLeft: false, module: 'Administrative', menu: 'contact' }},
      { path: 'contact/edit/:id', component: contactEdit, name: 'contactEdit', meta: { hideLeft: false, module: 'Administrative', menu: 'contact' }}
    ]
  },
  {
    path: '/home',
    component: Home,
    children: [
      { path: 'shouye/list', component: shouyeList, name: 'shouyeList', meta: { hideLeft: false, module: 'Administrative', menu: 'shouye' }},
      { path: 'shouye/add', component: shouyeAdd, name: 'shouyeAdd', meta: { hideLeft: false, module: 'Administrative', menu: 'shouye' }},
      { path: 'shouye/edit/:id', component: shouyeEdit, name: 'shouyeEdit', meta: { hideLeft: false, module: 'Administrative', menu: 'shouye' }}
    ]
  },
  {
    path: '/home',
    component: Home,
    children: [
      { path: 'friend/list', component: friendList, name: 'friendList', meta: { hideLeft: false, module: 'Administrative', menu: 'friend' }},
      { path: 'friend/add', component: friendAdd, name: 'friendAdd', meta: { hideLeft: false, module: 'Administrative', menu: 'friend' }},
      { path: 'friend/edit/:id', component: friendEdit, name: 'friendEdit', meta: { hideLeft: false, module: 'Administrative', menu: 'friend' }}
    ]
  },
  {
    path: '/home',
    component: Home,
    children: [
      { path: 'mysqls/list', component: mysqlsList, name: 'mysqlsList', meta: { hideLeft: false, module: 'Administrative', menu: 'mysqls' }},
    ]
  },
  {
    path: '/home',
    component: Home,
    children: [
      { path: 'measure/list', component: measureList, name: 'measureList', meta: { hideLeft: false, module: 'Administrative', menu: 'measure' }},
    ]
  },{
    path: '/home',
    component: Home,
    children: [
      { path: 'joins/list', component: joinsList, name: 'joinsList', meta: { hideLeft: false, module: 'Administrative', menu: 'joins' }},
      { path: 'joins/add', component: joinsAdd, name: 'joinsAdd', meta: { hideLeft: false, module: 'Administrative', menu: 'joins' }},
      { path: 'joins/edit/:id', component: joinsEdit, name: 'joinsEdit', meta: { hideLeft: false, module: 'Administrative', menu: 'joins' }}
    ]
  }

]
export default routes
