<template>
<div>
  <div class="m-b-20">
    <router-link class="btn-link-large add-btn" to="add">
      <i class="el-icon-plus"></i>&nbsp;&nbsp;添加产品
    </router-link>
  </div>
  <el-table :data="tableData" style="width: 100%" @selection-change="selectItem">
    <el-table-column type="selection" width="50">
    </el-table-column>
    <el-table-column label="ID" prop="id" width="100">
    </el-table-column>
    <el-table-column label="产品名称" prop="title">
    </el-table-column>
    <el-table-column label="产品分类" prop="am_title">
    </el-table-column>
    <el-table-column label="列表图" prop="litpic">
      <template scope="scope">
          <div class="bgimg" v-show='scope.row.litpic'>
              <img :src='scope.row.litpic'>
          </div>
          <div class="bgimg" v-show='scope.row.litpic == false'>
              <span>暂无图片</span>
          </div>
        </template>
    </el-table-column>

    <el-table-column label="添加时间" prop="create_time" width="150">
    </el-table-column>
    <el-table-column
    label="推送状态"
    prop="status">
      <template scope="scope">
        <div>
          {{ scope.row.status | push }}
        </div>
      </template>
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
  						<router-link :to="{ name: 'productEdit', params: { id: scope.row.id }}" class="btn-link edit-btn">
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
    <btnGroup :selectedData="multipleSelection" :type="'product'"></btnGroup>
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
      this.$confirm('确认删除该产品?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        _g.openGlobalLoading()
        this.apiDelete('admin/product/', item.id).then((res) => {
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
    getproduct() {
      this.apiGet('admin/product').then((res) => {
        this.handelResponse(res, (data) => {
          this.tableData = data
        })
      })
    }
  },
  created() {
    this.getproduct()
  },
  computed: {
    addShow() {
      return _g.getHasRule('product-save')
    },
    editShow() {
      return _g.getHasRule('product-update')
    },
    deleteShow() {
      return _g.getHasRule('product-delete')
    }
  },
  components: {
    btnGroup
  },
  mixins: [http]
}
</script>
