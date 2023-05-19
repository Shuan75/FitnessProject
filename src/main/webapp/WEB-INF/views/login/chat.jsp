<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../css/noticestyle.css" rel="stylesheet" type="text/css">
<%@ include file="../header.jsp"%>

<style>
section {
	display: -webkit-flex;
	display: flex;
}

article {
	-webkit-flex: 3;
	-ms-flex: 3;
	flex: 3;
	padding: 10px;
}
</style>

<section class="mypage">

	<nav>
		<div id="navigation">
			<div class="snb">
				<h2>마이페이지</h2>
				<ul>
					<li><a href="#" onclick="location.href='modify.do?id=${s_id}'">회원정보수정</a></li>
					<li><a href="#" onclick="location.href='calendar.do'">달력</a></li>
					<li><a href="#" onclick="location.href='chart.do'">차트</a></li>
					<li><a href="#" onclick="location.href='pay.do'">결제</a></li>
					<li><a href="#" onclick="location.href='chat.do'">온라인강의</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<article>


		<div>
			<video id="localVideo" autoplay width="480px"></video>
			<video id="remoteVideo" width="480px" autoplay></video>
		</div>

		<script src="/socket.io/socket.io.js"></script>
		<script src="./rtc.js"></script>
		<script>
    let localVideo = document.getElementById("localVideo");
    let remoteVideo = document.getElementById("remoteVideo");
    let localStream;

    navigator.mediaDevices
      .getUserMedia({
        video: true,
        audio: false,
      })
      .then(gotStream)
      .catch((error) => console.error(error));

    function gotStream(stream) {
      console.log("Adding local stream");
      localStream = stream;
      localVideo.srcObject = stream;
      sendMessage("got user media");
      if (isInitiator) {
        maybeStart();
      }
    }
    function sendMessage(message){
    	  console.log('Client sending message: ',message);
    	  socket.emit('message',message);
    }
    
    function createPeerConnection() {
    	  try {
    	    pc = new RTCPeerConnection(null);
    	    pc.onicecandidate = handleIceCandidate;
    	    pc.onaddstream = handleRemoteStreamAdded;
    	    console.log("Created RTCPeerConnection");
    	  } catch (e) {
    	    alert("connot create RTCPeerConnection object");
    	    return;
    	  }
    	}

    	function handleIceCandidate(event) {
    	  console.log("iceCandidateEvent", event);
    	  if (event.candidate) {
    	    sendMessage({
    	      type: "candidate",
    	      label: event.candidate.sdpMLineIndex,
    	      id: event.candidate.sdpMid,
    	      candidate: event.candidate.candidate,
    	    });
    	  } else {
    	    console.log("end of candidates");
    	  }
    	}

    	function handleCreateOfferError(event) {
    	  console.log("createOffer() error: ", event);
    	}

    	function handleRemoteStreamAdded(event) {
    	  console.log("remote stream added");
    	  remoteStream = event.stream;
    	  remoteVideo.srcObject = remoteStream;
    	}

    	function maybeStart() {
    		  console.log(">>MaybeStart() : ", isStarted, localStream, isChannelReady);
    		  if (!isStarted && typeof localStream !== "undefined" && isChannelReady) {
    		    console.log(">>>>> creating peer connection");
    		    createPeerConnection();
    		    pc.addStream(localStream);
    		    isStarted = true;
    		    console.log("isInitiator : ", isInitiator);
    		    if (isInitiator) {
    		      doCall();
    		    }
    		  }else{
    		    console.error('maybeStart not Started!');
    		  }
    		}
    	function doCall() {
    		  console.log("Sending offer to peer");
    		  pc.createOffer(setLocalAndSendMessage, handleCreateOfferError);
    		}

    		function doAnswer() {
    		  console.log("Sending answer to peer");
    		  pc.createAnswer().then(
    		    setLocalAndSendMessage,
    		    onCreateSessionDescriptionError
    		  );
    		}

    		function setLocalAndSendMessage(sessionDescription) {
    		  pc.setLocalDescription(sessionDescription);
    		  sendMessage(sessionDescription);
    		}
    		
    		let pcConfig = {
    			    'iceServers': [{
    			        'urls': 'stun:stun.l.google.com:19302'
    			      }]
    			}

    			socket.on('message', (message)=>{
    			  console.log('Client received message :',message);
    			  if(message === 'got user media'){
    			    maybeStart();
    			  }else if(message.type === 'offer'){
    			    if(!isInitiator && !isStarted){
    			      maybeStart();
    			    }
    			    pc.setRemoteDescription(new RTCSessionDescription(message));
    			    doAnswer();
    			  }else if(message.type ==='answer' && isStarted){
    			    pc.setRemoteDescription(new RTCSessionDescription(message));
    			  }else if(message.type ==='candidate' &&isStarted){
    			    const candidate = new RTCIceCandidate({
    			      sdpMLineIndex : message.label,
    			      candidate:message.candidate
    			    });

    			    pc.addIceCandidate(candidate);
    			  }
    			})
    			
    			const http = require('http');
const os = require('os');
const socketIO = require('socket.io');
const nodeStatic = require('node-static');

let fileServer = new(nodeStatic.Server)();
let app = http.createServer((req,res)=>{
    fileServer.serve(req,res);
}).listen(8080);

let io = socketIO.listen(app);
io.sockets.on('connection',socket=>{
    function log() {
        let array = ['Message from server:'];
        array.push.apply(array,arguments);
        socket.emit('log',array);
    }

    socket.on('message',message=>{
        log('Client said : ' ,message);
        socket.broadcast.emit('message',message);
    });

    socket.on('create or join',room=>{
        let clientsInRoom = io.sockets.adapter.rooms[room];
        let numClients = clientsInRoom ? Object.keys(clientsInRoom.sockets).length : 0;
        log('Room ' + room + ' now has ' + numClients + ' client(s)');
        
        if(numClients === 0){
            console.log('create room!');
            socket.join(room);
            log('Client ID ' + socket.id + ' created room ' + room);
            socket.emit('created',room,socket.id);
        }
        else if(numClients===1){
            console.log('join room!');
            log('Client Id' + socket.id + 'joined room' + room);
            io.sockets.in(room).emit('join',room);
            socket.join(room);
            socket.emit('joined',room,socket.id);
            io.sockets.in(room).emit('ready');
        }else{
            socket.emit('full',room);
        }
    });


});
    
    </script>
    <h3>보안달고 새창 만들어서 구현 필요</h3>
	</article>
</section>
<%@ include file="../footer.jsp"%>
