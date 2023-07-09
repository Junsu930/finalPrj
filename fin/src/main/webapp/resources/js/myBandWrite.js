
ClassicEditor.create( document.querySelector( '#editor' ) ,{
    
    removePlugins: [ 'Heading' ],
    extraPlugins: [MyCustomUploadAdapterPlugin],
    language: "ko",
  
});

class UploadAdapter {
    constructor(loader) {
        this.loader = loader;
    }

    upload() {
        return this.loader.file.then( file => new Promise(((resolve, reject) => {
            this._initRequest();
            this._initListeners( resolve, reject, file );
            this._sendRequest( file );
        })))
    }

    _initRequest() {
        const xhr = this.xhr = new XMLHttpRequest();
        xhr.open('POST', '/fin/myBandImgUpload', true);
        xhr.responseType = 'json';
    }

    _initListeners(resolve, reject, file) {
        const xhr = this.xhr;
        const loader = this.loader;
        const genericErrorText = '파일을 업로드 할 수 없습니다.'

        xhr.addEventListener('error', () => {reject(genericErrorText)})
        xhr.addEventListener('abort', () => reject())
        xhr.addEventListener('load', () => {
            const response = xhr.response
            if(!response || response.error) {
                return reject( response && response.error ? response.error.message : genericErrorText );
            }

            resolve({
                default: response.url //업로드된 파일 주소
            })
        })
    }

    _sendRequest(file) {
        const data = new FormData()
        data.append('upload',file)
        this.xhr.send(data)
    }
}


function MyCustomUploadAdapterPlugin(editor) {
    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
        return new UploadAdapter(loader)
    }
}

function vacantCheck(){
    if($("#titleInputForBandBoard").val() == null || $("#titleInputForBandBoard").val() == ""){
        swal.fire("제목을 입력해주세요");
        return false;
    }else if($("#editor").val()== null || $("#editor").val() == ""){
        swal.fire("내용을 입력해주세요");
        return false;
    }else{
        return true;
    }
}