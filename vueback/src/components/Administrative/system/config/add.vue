<template>
<div class="m-l-50 m-t-30 w-500">
  <el-form ref="form"   :model="form" :rules="rules" label-width="130px">
    <el-form-item label="网站名称" prop="SYSTEM_NAME">
      <el-input v-model.trim="form.SYSTEM_NAME" class="h-40 w-800"></el-input>
    </el-form-item>
    <el-form-item label="LOGO">
      <el-upload :action="uploadUrl" type="drag" :thumbnail-mode="true" :on-preview="viewPic" :on-remove="handleRemove" :on-success="uploadSuccess" :on-error="uploadFail" :default-file-list="fileList">
        <div class="LOGO">
          <img :src="form.SYSTEM_LOGO" alt="图片">
        </div>
        <div class="el-dragger__text"><em>点击上传&nbsp;&nbsp;(只能上传jpg/png文件)</em></div>
      </el-upload>
    </el-form-item>
    <el-form-item label="LOGO_M">
      <el-upload :action="uploadUrl" type="drag" :thumbnail-mode="true" :on-preview="viewPic" :on-remove="handleRemove" :on-success="uploadSuccess2" :on-error="uploadFail" :default-file-list="fileList2">
        <div class="LOGO">
          <img :src="form.SYSTEM_LOGO_M" alt="图片">
        </div>
        <div class="el-dragger__text"><em>点击上传&nbsp;&nbsp;(只能上传jpg/png文件)</em></div>
      </el-upload>
    </el-form-item>

    <el-form-item label="网站版权信息" prop="COPY_RIGHT">
      <el-input v-model.trim="form.COPY_RIGHT" class="h-40 w-800"></el-input>
    </el-form-item>
    <el-form-item label="网站备案号" prop="BEI_AN">
      <el-input v-model.trim="form.BEI_AN" class="h-40 w-800"></el-input>
    </el-form-item>
    <el-form-item label="网站关键字">
      <el-input type="textarea" class="w-800" :autosize="{ minRows: 2, maxRows: 14}" placeholder="请输入内容" v-model="form.KEY_WORD">
      </el-input>
    </el-form-item>
    <el-form-item label="网站描述">
      <el-input type="textarea" class="w-800" :autosize="{ minRows: 2, maxRows: 14}" placeholder="请输入内容" v-model="form.DESCRIPTION">
      </el-input>
    </el-form-item>
    <el-form-item label="登录会话有效期" prop="LOGIN_SESSION_VALID">
      <el-input v-model.number="form.LOGIN_SESSION_VALID" class="h-40 w-200"></el-input>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="add()" :loading="isLoading">提交</el-button>
    </el-form-item>
  </el-form>
  <preview ref="preview" :url="propsImg"></preview>
</div>
</template>
<script>
import http from '../../../../assets/js/http'
import preview from './preview.vue'

export default {
  data() {
    return {
      tableData: [],
      isLoading: false,
      fileList: [],
      propsImg: '',
      form: {
        SYSTEM_NAME: '',
        IDENTIFYING_CODE: '0',
        LOGO_TYPE: '1',
        LOGIN_SESSION_VALID: '3600',
        SYSTEM_LOGO: '',
        SYSTEM_LOGO_M: '',
        COPY_RIGHT: '',
        BEI_AN: '',
        KEY_WORD: '',
        DESCRIPTION: ''
      },
      uploadUrl: '',
      // uploadUrl2: '',
      rules: {
        SYSTEM_NAME: [{
          required: true,
          message: '请输入系统名称'
        }],
        LOGIN_SESSION_VALID: [{
            required: true,
            message: '请输入登录有效期'
          }
        ]
      }
    }
  },
  methods: {
    add() {
      this.$refs.form.validate((pass) => {
        if (pass) {
          this.isLoading = !this.isLoading
          this.apiPost('admin/systemConfigs', this.form).then((res) => {
            this.handelResponse(res, (data) => {
              _g.toastMsg('success', '提交成功')
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
    uploadSuccess(res, file, fileList) {
      this.form.SYSTEM_LOGO = res.data
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
    uploadSuccess2(res, file2, fileList2) {
      console.log(res)
      this.form.SYSTEM_LOGO_M = res.data
      let data = {
        name: '图片',
        url: file2.url
      }
      if (this.fileList2.length) {
        this.fileList2[0] = data
      } else {
        this.fileList2.push(data)
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
    viewPic() {
      this.propsImg = this.fileList[0].url
      this.$refs.preview.open()
    },
    getSystemConfig() {
      this.form.id = this.$route.params.id
      this.apiGet('admin/systemConfigs/' + this.form.id).then((res) => {
      // this.apiGet('admin/systemConfigs').then((res) => {
        this.handelResponse(res, (data) => {
          this.form.SYSTEM_NAME = data.SYSTEM_NAME
          this.form.IDENTIFYING_CODE = data.IDENTIFYING_CODE
          this.form.LOGIN_SESSION_VALID = data.LOGIN_SESSION_VALID
          this.form.LOGO_TYPE = data.LOGO_TYPE
          this.form.COPY_RIGHT = data.COPY_RIGHT
          this.form.BEI_AN = data.BEI_AN
          this.form.KEY_WORD = data.KEY_WORD
          this.form.DESCRIPTION = data.DESCRIPTION
          if (data.SYSTEM_LOGO) {
            let img = window.HOST + data.SYSTEM_LOGO
            this.fileList.push({
              name: '图片',
              url: img
            })
            this.form.SYSTEM_LOGO = data.SYSTEM_LOGO
          }
          if (data.SYSTEM_LOGO_M) {
            let image = window.HOST + data.SYSTEM_LOGO_M
            this.fileList.push({
              name: '图片',
              url: image
            })
            this.form.SYSTEM_LOGO_M = data.SYSTEM_LOGO_M
          }
        })
      })
    }
  },

  created() {
    this.uploadUrl = window.HOST + 'admin/upload'
    // this.uploadUrl2 = window.HOST + 'admin/upload'
    this.getSystemConfig()
    _g.closeGlobalLoading()
  },
  components: {
    preview
  },
  mixins: [http]
}
</script>
