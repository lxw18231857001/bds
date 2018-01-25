<template>
<div>
  <div class="m-b-20">
    <router-link class="btn-link-large add-btn" to="add">
      <i class="el-icon-plus"></i>&nbsp;&nbsp;添加首页信息
    </router-link>
  </div>
  <el-table :data="tableData" style="width: 100%" @selection-change="selectItem">
    <el-table-column type="selection" width="50">
    </el-table-column>
    <el-table-column label="ID" prop="id" width="100">
    </el-table-column>
    <el-table-column label="标题" prop="title">
    </el-table-column>
    <el-table-column label="背景图" prop="backimage">
      <template scope="scope">
          <div class="bgimg" v-show='scope.row.backimage'>
              <img :src='scope.row.backimage'>
          </div>
          <div class="bgimg" v-show='scope.row.backimage == false'>
              <span>暂无图片</span>
          </div>
        </template>
    </el-table-column>

    <el-table-column label="Banner所在位置" prop="am_title">
    </el-table-column>
    <!-- <el-table-column label="Banner所在位置" prop="am_title">
      <template scope="scope">
          <div class="bgimg" v-show='scope.row.am_title'>
              <span>首页背景图</span>
          </div>
          <div class="bgimg" v-show='scope.row.backimage == false'>
              <span>首页背景图</span>
          </div>
        </template>
    </el-table-column> -->

    <el-table-column label="添加时间" prop="create_time" width="150">
    </el-table-column>
    <el-table-column label="排序" prop="order" width="100">
      <template scope="scope">
          <div>
            {{ scope.row.order }}
          </div>
        </template>
    </el-table-column>

    <el-table-column label="操作" width="200">
      <template scope="scope">
  				<div>
  					<span>
  						<router-link :to="{ name: 'shouyeEdit', params: { id: scope.row.id }}" class="btn-link edit-btn">
  						编辑
  						</router-link>
  					</span>
  					<span>
  						<el-button
  						<el-button
  						size="small"
  						type="danger"
  						@click="confirmDelete(scope.row)">
  						删除
  						</el-button>
  					</span>
  				</div>
        </template>
    </el-table-column>
  </el-table>
  <div class="pos-rel p-t-20">
    <btnGroup :selectedData="multipleSelection" :type="'shouye'"></btnGroup>
  </div>
</div>
</template>
<style>
.cell .bgimg img {
  width: 50px;
  height: 27px;
  padding-top: 5px;
}
</style>
<script>
import btnGroup from '../../../Common/btn-group.vue'
import http from '../../../../assets/js/http'

export default {
  data() {
    return {
      tableData: [],
      multipleSelection: [],
    }
  },
  methods: {
    selectItem(val) {
      this.multipleSelection = val
    },
    confirmDelete(item) {
      this.$confirm('确认删除该信息?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        _g.openGlobalLoading()
        this.apiDelete('admin/shouye/', item.id).then((res) => {
          _g.closeGlobalLoading()
          this.handelResponse(res, (data) => {
            _g.toastMsg('success', '删除成功')
            setTimeout(() => {
              _g.shallowRefresh(this.$route.name)
            }, 1500)
          })
        })
      }).catch(() => {
        // handle error
      })
    },
    getshouye() {
      this.apiGet('admin/shouye').then((res) => {
        this.handelResponse(res, (data) => {
          this.tableData = data
        })
      })
    }
  },
  created() {
    this.getshouye()
  },
  computed: {
    addShow() {
      return _g.getHasRule('shouye-save')
    },
    editShow() {
      return _g.getHasRule('shouye-update')
    },
    deleteShow() {
      return _g.getHasRule('shouye-delete')
    }
  },
  components: {
    btnGroup
  },
  mixins: [http]
}
</script>
