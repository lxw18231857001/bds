<template>
<div class="m-l-50 m-t-30 w-900">
  <div class=" top-active">修改新闻</div>
  <el-form ref="form" :model="form" :rules="rules" label-width="130px">
    <el-form-item label="新闻标题" prop="title">
      <el-input v-model.trim="form.title" class="h-40 w-500" ></el-input>
    </el-form-item>
    <el-form-item label="来源" prop="writer">
      <el-input v-model.trim="form.writer" class="h-40 w-200"></el-input>
    </el-form-item>
    <el-form-item label="列表图" prop="listpic">
      <el-upload :action="uploadUrl" type="drag" :thumbnail-mode="true" :on-preview="viewPic" :on-remove="handleRemove" :on-success="uploadSuccess" :on-error="uploadFail" :default-file-list="fileList">
        <div class="bgimg">
          <img :src="form.listpic" alt="图片">
        </div>
        <div class="el-dragger__text"><em>点击上传&nbsp;&nbsp;&nbsp;(只能上传jpg/png文件)</em></div>
      </el-upload>
    </el-form-item>
    <el-form-item label="修改日期">
      <el-col :span="11">
        <el-form-item prop="create_time">
          <el-date-picker type="datetime" placeholder="修改日期" size="small" v-model="form.create_time" style="width: 60%;">
          </el-date-picker>
        </el-form-item>
      </el-col>
    </el-form-item>
    <el-form-item label="新闻分类" prop="pid">
      <el-select v-model="form.pid" placeholder="新闻分类" class="w-200">
        <el-option v-for="item in options" :label="item.title" :value="item.id"></el-option>
      </el-select>
    </el-form-item>
    <el-form-item label="排序" prop="order">
      <el-input v-model.number="form.order" class="h-40 w-200"></el-input>
    </el-form-item>
    <el-form-item label="新闻内容" prop="content">
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
        writer: '',
        listpic: '',
        create_time: '',
        order: '',
        type:'',
        content: ''
      },
      options: [],
      uploadUrl: '',
      rules: {
        pid:[{
          required: true,
          message: '请选择分类',
        }],
        title: [{
          required: true,
          message: '请输入新闻名称',
          trigger: 'blur'
        }],
        writer: [{
          required: true,
          message: '请输入新闻来源',
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
          this.apiPut('admin/news/', this.form.id, this.form).then((res) => {
            this.handelResponse(res, (data) => {
              _g.toastMsg('success', '编辑成功')
              setTimeout(() => {
                this.goback()
              }, 2500)
            }, () => {
              this.isLoading = !this.isLoading
            })
          })
        }
      })
    },
    getSerInfo() {
      this.form.id = this.$route.params.id
      this.apiGet('admin/news/' + this.form.id).then((res) => {
        this.handelResponse(res, (data) => {
          this.form.title = data.title
          this.form.writer = data.writer
          this.form.pid = data.pid
          this.form.listpic = data.listpic
          this.form.content = data.content
          this.form.order = data.order
          this.form.create_time = data.create_time
        })
      })
    },
    getNewType() {
      this.apiGet('admin/newtype').then((res) => {
        console.log(res)
        this.handelResponse(res, (data) => {
          this.options = this.options.concat(data)
        })
      })
    },
    getUEContent() {
      let content = this.$refs.ue.getUEContent();
      this.form.content = content
    },
    uploadSuccess(res, file, fileList) {
      this.form.listpic = res.data
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
    this.getNewType()
    this.getSerInfo()
    this.uploadUrl = window.HOST + 'admin/upload'
    _g.closeGlobalLoading()
  },

  mixins: [http, fomrMixin]
}
</script>
