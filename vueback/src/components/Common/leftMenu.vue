<template>
<!-- <div>
<el-menu mode="vertical" default-active="/table" class="el-menu-vertical-demo" @select="handleselect" theme="dark" router>
<el-menu-item-group v-for="menu in menuData" :title="menu.title">
<el-menu-item v-for="item in menu.items" :index="item.path">&nbsp;&nbsp;&nbsp;&nbsp;{{item.name}}</el-menu-item>
</el-menu-item-group>
</el-menu>
</div> -->

<div>
  <div v-for="(secMenu,key) in menuData">
    <div class="c-light-gray h-40 p-l-30 m-t-10" @click="showtohide(key)">{{secMenu.title}}&nbsp;<span v-if="listNum===key">{{symbol}}</span><span v-if="listNum!==key">+</span></div>
    <div class="h-40" v-for="item in secMenu.child" v-show="listNum===key">
      <template v-if="item.menu == menu">
					<div class="w-100p h-40 p-l-50 left-menu pointer c-blue" @click="routerChange(item)">{{item.title}}</div>
			</template>
      <template v-else>
					<div class="w-100p h-40 p-l-50 left-menu pointer c-gra" @click="routerChange(item)">{{item.title}}</div>
			</template>
    </div>
  </div>
</div>
</template>

<script>
var a = 1;
export default {
  props: ['menuData', 'menu'],
  data() {
    return {
      symbol: '-',
      listNum: 0,
    }
  },
  methods: {
    routerChange(item) {
      // 与当前页面路由相等则刷新页面
      if (item.url != this.$route.path) {
        router.push(item.url)
      } else {
        _g.shallowRefresh(this.$route.name)
      }
    },
    showtohide(key) {
      this.listNum = key;
      this.symbol = '-';
    }
  }
}
</script>
