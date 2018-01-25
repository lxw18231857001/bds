<template>
<div class="m-l-50 m-t-30 w-900">
  <div class=" top-active">添加友情链接</div>
  <el-form ref="form" :model="form" :rules="rules" label-width="130px">
    <el-form-item label="标题" prop="title">
      <el-input v-model.trim="form.title" class="h-40 w-200"></el-input>
    </el-form-item>
    <el-form-item label="链接地址" prop="url">
      <el-input v-model.trim="form.url" class="h-40 w-200"></el-input>
    </el-form-item>
    <el-form-item label="添加日期">
      <el-col :span="11">
        <el-form-item prop="create_time">
          <el-date-picker type="datetime" placeholder="添加日期" size="small" v-model="form.create_time" style="width: 60%;">
          </el-date-picker>
        </el-form-item>
      </el-col>
    </el-form-item>
    <el-form-item label="排序" prop="order">
      <el-input v-model.number="form.order" class="h-40 w-200"></el-input>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="add('form')" :loading="isLoading">提交</el-button>
      <el-button @click="goback()">返回</el-button>
    </el-form-item>
  </el-form>
</div>
</template>

<script>
import http from '../../../../assets/js/http'
import fomrMixin from '../../../../assets/js/form_com'
import UE from '../../../Common/ue.vue'

export default {
  components: {
    UE
  },
  data() {
    return {
      isLoading: false,
      fileList: [],
      form: {
        title: '',
        url: '',
        create_time: '',
        order: '',
      },
      uploadUrl: '',
      rules: {
        title: [{
          required: true,
          message: '请输入友情链接标题',
          trigger: 'blur'
        }],
        url: [{
          required: true,
          message: '请输入链接地址',
          trigger: 'blur'
        }],
        create_time: [{
          type: 'date',
          required: true,
          message: '请选择添加日期',
          trigger: 'change'
        }],
        order: [{
          required: true,
          message: '请输入排序'
        }, {
          type: 'number',
          message: '请输入数字',
          trigger: 'blur'
        }],

      },
      config: {
        initialFrameWidth: null,
        initialFrameHeight: 350
      }
    }
  },

  methods: {
    add(form) {
      this.$refs[form].validate((valid) => {
        if (valid) {
          this.isLoading = !this.isLoading
          this.apiPost('admin/friend', this.form).then((res) => {
            this.handelResponse(res, (data) => {
              console.log(res)
              console.log(data)
              _g.toastMsg('success', '添加成功')
              setTimeout(() => {
                this.goback()
              }, 1500)
            }, () => {
              this.isLoading = !this.isLoading
            })
          })
        }
      })
    },
    getUEContent() {
      let content = this.$refs.ue.getUEContent();
      this.form.content = content
    },

    uploadSuccess(res, file, fileList) {
      this.form.logo = res.data
      let data = {
        name: '图片',
        url: file.url
      }
      if (this.fileList.length) {
        this.fileList[0] = data
      } else {
        this.fileList.push(data)
      }
    },
    uploadFail(err, res, file) {
      console.log('err = ', _g.j2s(err))
      console.log('res = ', _g.j2s(res))
    },
    handleRemove(file, fileList) {
      console.log('file = ', file)
      console.log('fileList = ', fileList)
    },
  },
  created() {
    this.uploadUrl = window.HOST + 'admin/upload'
    _g.closeGlobalLoading()
  },

  mixins: [http, fomrMixin]
}
</script>
