var naver_id_login = new naver_id_login("cE2qHHhSMkJYsQGPIKaz", "http://127.0.0.1:8080/fin/callback");
var state = naver_id_login.getUniqState();
naver_id_login.setButton("white", 3,45);
naver_id_login.setDomain("http://localhost:8080/fin/");
naver_id_login.setState(state);
naver_id_login.setPopup();
naver_id_login.init_naver_id_login();





