<template>
<div class="m-l-50 m-t-30 w-900">
  <div class=" top-active">修改公司信息</div>
  <el-form ref="form" :model="form" :rules="rules" label-width="130px">
    <el-form-item label="公司信息标题" prop="title">
      <el-input v-model.trim="form.title" class="h-40 w-200"></el-input>
    </el-form-item>
    <el-form-item label="地址" prop="address">
      <el-input v-model.trim="form.address" class="h-40 w-500"></el-input>
    </el-form-item>
    <el-form-item label="电话" prop="tel">
      <el-input v-model.trim="form.tel" class="h-40 w-200"></el-input>
    </el-form-item>
    <el-form-item label="全国统一服务热线" prop="hotline">
      <el-input v-model.trim="form.hotline" class="h-40 w-200"></el-input>
    </el-form-item>
    <el-form-item label="邮箱" prop="email">
      <el-input v-model.email="form.email" class="h-40 w-200"></el-input>
    </el-form-item>
    <el-form-item label="邮编" prop="posts">
      <el-input v-model.email="form.posts" class="h-40 w-200"></el-input>
    </el-form-item>

    <el-form-item label="修改日期">
      <el-col :span="11">
        <el-form-item prop="create_time">
          <el-date-picker type="datetime" placeholder="修改日期" size="small" v-model="form.create_time" style="width: 60%;">
          </el-date-picker>
        </el-form-item>
      </el-col>
    </el-form-item>
    <!-- <el-form-item label="排序" prop="order">
      <el-input v-model.number="form.order" class="h-40 w-200"></el-input>
    </el-form-item>
    <el-form-item label="类型" prop="type">
      <el-radio-group v-model="form.type">
        <el-radio label="1">公司总/分部</el-radio>
        <el-radio label="2">其他</el-radio>
      </el-radio-group>
    </el-form-item> -->
    <el-form-item label="公司信息内容" prop="content">
      <div class="editor-container">
        <UE :defaultMsg=form.content :config=config ref="ue"></UE>
      </div>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="getUEContent();edit('form')" :loading="isLoading">提交</el-button>
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
        id: null,
        title: '',
        address: '',
        tel: '',
        hotline: '',
        email: '',
        posts: '',
        backimage: '',
        create_time: '',
        order: '',
        content: ''
      },
      uploadUrl: '',
      rules: {
        title: [{
          required: true,
          message: '请输入公司信息名称',
          trigger: 'blur'
        }],
        email: [{
          type:'email',
          message: '邮箱格式不正确',
          trigger: 'blur'
        }],
        hremail: [{
          type:'email',
          message: '招聘邮箱格式不正确',
          trigger: 'blur'
        }],
        order: [{
          required: true,
          message: '请输入排序'
        }, {
          type: 'number',
          message: '请输入数字',
          trigger: 'blur'
        }],
        content: [{
          required: true,
          message: '请输入内容',
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
    edit(form) {
      this.$refs[form].validate((valid) => {
        if (valid) {
          this.isLoading = !this.isLoading
          this.apiPut('admin/contact/', this.form.id, this.form).then((res) => {
            this.handelResponse(res, (data) => {
              _g.toastMsg('success', '编辑成功')
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
    getSerInfo() {
      this.form.id = this.$route.params.id
      this.apiGet('admin/contact/' + this.form.id).then((res) => {
        this.handelResponse(res, (data) => {
          this.form.title = data.title
          this.form.address = data.address
          this.form.backimage = data.backimage
          this.form.content = data.content
          this.form.tel = data.tel
          this.form.hotline = data.hotline
          this.form.email = data.email
          this.form.posts = data.posts
          this.form.content = data.content
          this.form.create_time = data.create_time
          this.form.order = data.order
          this.form.type = data.type

        })
      })
    },
    getUEContent() {
      let content = this.$refs.ue.getUEContent();
      this.form.content = content
    },
    uploadSuccess(res, file, fileList) {
      this.form.backimage = res.data
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
    this.getSerInfo()
    this.uploadUrl = window.HOST + 'admin/upload'
    _g.closeGlobalLoading()
  },

  mixins: [http, fomrMixin]
}
</script>
