.((classname)) .mask-((sex)) {
	position: absolute;
	top: ((maskPosition))px;
	left: ((maskPosition))px;
	width: ((maskRadius))px;
	height: ((maskRadius))px;
	border-radius: 100%;
	z-index: 23;
	transform: translateZ(0) rotate(((statusDegPointer))deg);
	-webkit-transform: translateZ(0) rotate(((statusDegPointer))deg);
}
.((classname)) .mask-((sex)):after {
	position: absolute;
	left: 50%;
	width: 0;
	height: 0;
	z-index: 20;
	content: "";
	((maskMark));
}
.((classname)) .mask-((sex))-outer {
	position: absolute;
	top: ((maskPosition))px;
	left: ((maskPosition))px;
	width: ((maskRadius))px;
	height: ((maskRadius))px;
	text-align: center;
	border-radius: 100%;
	background-color: ((innerCircle));
	z-index: 22;
	-webkit-transform: translateZ(0);
	transform: translateZ(0);
	box-shadow: 0px 4px 7px 1px rgba(0, 0, 0, 0.3);
}
.((classname)) .mask-((sex))-inner {
	display: inline-block;
	vertical-align: middle;
	font-size: 12px;
	color: #666;
	font-family: "Microsoft Yahei";
}
.((classname)) .mask-((sex))-outer .clear-float {
	display: inline-block;
	height: ((maskRadius))px;
	vertical-align: middle;
	width: 0;
	overflow: hidden;
}
.((classname)) .showy {
	color: #ff6a8e;
}
.((classname)) .percent {
	font-size: 60px;
	line-height: 60px;
	font-family: arial;
}
.((classname)) .percent-down {
	display: inline-block;
	width: 36px;
	height: 40px;
	margin-left: 9px;
	background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEkAAABPCAMAAACQ9BjzAAAAhFBMVEUAAACV01+V01+V01+V01+V01+V01+V01+V01+V01+V01+V01+V01+V01+V01+V01+V01+V01+V01+V01+V01+V01+V01+V01+V01+V01+V01+V01+V01+V01////+z35Ho9d/O6rry+ezd8NCd1m36/fjB5Kas3Iak2XrI57G64ZzV7MSKl6OlAAAAHXRSTlMA7uQP6H9tKDS+tvwD9qtCCdIW3R/Inoh2kV5SZiT5GysAAALGSURBVFjD7ZjJmqowEEYLBJlnFEQTJkW9/f7vd5NuUDCJ0KEXveizkQ3nS6rqDyBwMbJI1QSouzyFpWyKnYOEeNYxXGoKLCoSq3xzocjNFfQW9bR0c9mMScmXmvS5NW3/TH+m32C6lgM3KVNXf9IhVOGBWsL0uL+iV01FaaRNbV23X6YSUWpZE72//L2me0lpf8DUs7ri63tHWV+nvjr339q75sd6hwfWmm6k7D+Tuw436JN67RRU+EPSBPljCgjXEuPrQlNsmBOC/aNOhHNDlvViOvE9Zu7b1gjbShw0QEWXW38IX3qTlhkvpCExbX3VQSxPEe7ockjyLsMUeJE9xT8UBsCOr3iaWvpbYgJdHR8nygAi573q/vVTUs5ISAJwIKr1eDsAM9MQl1vJItxdogOE5t5DPGrMUvNFtJv0BTWwEI+y7iEDNVyWfJGyN1wghEWE3lHRpcy8Vrv9cOraKtMucKHH2DsrTEkRjr8K5E1qHsOT8BjJmpQsnp5JW5W5n0fFiA4pTEkPioSJ+zVk+oKq/yMCUeAcOwAG9yg4FVpi6gSmqHB5x/dJ5cYP4xY3olfXDfBIdYW7pAtq+N1T9BT4GHtW1WF8p6WiiRO3jVN1hRU1Xwu7cmILYgLbexVdbv1z4d9L/2n+xbhFMj55WyK6Ds8V3J6n/aciMfGo6h25uxk2dW2Itb498z/7qW8MJ2jX4Mkyzh/jGU9OG5jBNe1HWpppacrqMaIJyT+DaNbPLTvYZa9Waf7nCU8Jo+AO0jzxzD8PzpD/eQzfe2eygjnBwsM4KsJllrnnVkLzv5xNrglEmh7Dt0gzRa5tLCa36p5vwHcJg53D9t9iYitZdRpbCTbb5LX/JLZSxI8GPvMviXHwxv0n+ZfFNX2H6b+kKrBGxzaswT1aTP4lCY+WQrfmBwCrVbaHtD2ZyNUYepTY2/m2/QdXDEdOu9xjVgAAAABJRU5ErkJggg==") no-repeat;
	background-size: 100%;
}
.((classname)) .percent-up {
	display: inline-block;
	width: 36px;
	height: 40px;
	margin-left: 9px;
	background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACkAAAAsCAMAAADPc2F3AAAAhFBMVEUAAAD/W4L/W4L/W4L/W4L/W4L/W4L/W4L/W4L/W4L/W4L/W4L/W4L/W4L/W4L/W4L/W4L/W4L/W4L/W4L/W4L/W4L/W4L//v7/4en/cJP/nrX/ytb/1+H/0Nz/dZb/v87/i6f/fZ3/aYz/9fj/tcf/pLr/k63/8PP/rcH/2+T/6O7/X4fkmADWAAAAFnRSTlMA7cgvEvQIoiH65BkD0WiwhEk8vVaWklygcwAAAZRJREFUOMvNk8mWgyAQRR3SJo6ZSxAR5yH5//9rFBM0GpJVn74LVvcU9apAW+BdDD+wNDVCdACc4AvzqANHv3wUTQMGnKOnFt29DQLjpBQ3Z3jiuwrROtggOe/em4EOE+zt5p14cmCGffDexPbhBT2w1mPDAv3iqdNI/OWsPJEmxxjnedRTi7GaiyWKNKQoCpaEKI5RJ2e1tkTKMkaSkNdL48es3NU0tISWm1WSRKMJP1drkuYKc7MHwQM5Viv4eZoNamRNOdblbijD5bxP8QTHJn2A2e3ZkB3BRDUXu6GkJiQKqygqO5hgmK+7oWERUoJgvF2yd4d/I2EVQN2kwM/45V1pBkzJc0hvDHBbij4lvrZ4QQnLAZOOpn0l/YEfaG5w3Qr6z5ZjSV/I3I1s+PQ9a8Tk82foCekjr/8PbgqICPPnZhVOoCozizhtE5YRJ/14e9o07Vd95jGLbtkXJqZcIyj7aGYoTAESVFR3pZmwQlTDtEC1MntXYRi4pyxTmXP+qen6C3NrrZre6ezoU5ztTpP8AkH1VESfwJV6AAAAAElFTkSuQmCC") no-repeat;
	background-size: 100%;
}
.((classname)) .cycle-avatar {
	display: inline-block;
	width: ((avatarRadius))px;
	height: ((avatarRadius))px;
	border-radius: 100%;
}
.((classname)) .cycle-((sex)) {
	position: relative;
	width: ((realRadius))px;
	height: ((realRadius))px;
	overflow: hidden;
}
.((classname)) .cycle-((sex))-1 {
	position: absolute;
	width: ((realRadius))px;
	height: ((realRadius))px;
	border-radius: 100%;
	z-index: 20;
	((clip));
}
.((classname)) .cycle-((sex))-1-1 {
	position: absolute;
	width: ((realRadius))px;
	height: ((realRadius))px;
	background-color: ((cycleColor_0));
	border-radius: 100%;
	transform: rotate(((rotate_child_0))deg);
	-webkit-transform: rotate(((rotate_child_0))deg);
	((clip));
	
}
.((classname)) .cycle-((sex))-2 {
	position: absolute;
	width: ((realRadius))px;
	height: ((realRadius))px;
	border-radius: 100%;
	z-index: 20;
	transform: translateZ(0) rotate( ((rotate_1))deg );
	-webkit-transform: translateZ(0) rotate( ((rotate_1))deg );
	((clip));
}
.((classname)) .cycle-((sex))-2-1 {
	position: absolute;
	width: ((realRadius))px;
	height: ((realRadius))px;
	background-color: ((cycleColor_1));
	border-radius: 100%;
	transform: rotate(((rotate_child_1))deg);
	-webkit-transform: rotate(((rotate_child_1))deg);
	((clip));
}
.((classname)) .cycle-((sex))-3 {
	position: absolute;
	width: ((realRadius))px;
	height: ((realRadius))px;
	border-radius: 100%;
	z-index: 20;
	transform: translateZ(0) rotate( ((rotate_2))deg );
	-webkit-transform: translateZ(0) rotate( ((rotate_2))deg );
	((clip));
}
.((classname)) .cycle-((sex))-3-1 {
	position: absolute;
	width: ((realRadius))px;
	height: ((realRadius))px;
	background-color: ((cycleColor_2));
	border-radius: 100%;
	transform: rotate(((rotate_child_2))deg);
	-webkit-transform: rotate(((rotate_child_2))deg);
	((clip));
}
.((classname)) .cycle-((sex))-4 {
	position: absolute;
	width: ((realRadius))px;
	height: ((realRadius))px;
	border-radius: 100%;
	z-index: 20;
	transform: translateZ(0) rotate( ((rotate_3))deg );
	-webkit-transform: translateZ(0) rotate( ((rotate_3))deg );
	((clip));
}
.((classname)) .cycle-((sex))-4-1 {
	position: absolute;
	width: ((realRadius))px;
	height: ((realRadius))px;
	background-color: ((cycleColor_3));
	border-radius: 100%;
	transform: rotate(((rotate_child_3))deg);
	-webkit-transform: rotate(((rotate_child_3))deg);
	((clip));
}
.((classname)) .nothidden {
	display: none;
}
.((classname)) .notclip {
	clip: auto;
}
.((classname)) .nottransform {
	-webkit-transform: translateZ(0) rotate(0);
	transform: translateZ(0) rotate(0);
}
.((classname)) .icon-start{
	position: relative;
	display: inline-block;
	width: ((starWidth))px;
	height: ((starHeight))px;
	margin:13px 2%;
	background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAAsCAMAAAAO9CvbAAAAe1BMVEUAAADt7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e3t7e1cKE5zAAAAKHRSTlMA+vVJWUzawbA8MAj3zUXq4Kl+cjQmFATX5se5tZ+ZlJOGamMqHg4Mv4r8zwAAAS5JREFUSMed1deOgzAQBVBsXKgJNaTvps//f+EKsaEZPLbv48hHFlfC4+nCU5pyzy0hAQASumEJbaTbxdDF6erzPz472Ai+iexx3uPc2tYwpLbFlxG+WNoXGWHyssO/MM6Pld3RCaY7Y/muWADTBKx6I6qpeXmVB1jOQV5LXjeLMswFATxE5KFi/V7ins9xCubZzzG1wMkcHy3wcY4r86tppTS2oaZ2MyBV49ZVJ763HD8xsq6ajKyqCWpdNcHWByeINX9DbN+TYBUHOBarWKA21nxzjG+Z9UQYZhrMMHzT4JtB2e51Cw0WZmXjdeNlSyaVug3LTv32T0nN6y6Gx/l7ku37WaHHd+iSPZphhT0y6HJHduu2PbQt42mNZTfGNu3zRLLio4w/RUZOz9nwD1h7o8p7N8yEAAAAAElFTkSuQmCC") repeat-x;
	background-size: auto 100%;
}
.((classname)) .icon-start i {
	position: absolute;
	left: 0;
	display: inline-block;
	width: ((pregnancyrate))%;
	height: 100%;
	background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAAsCAMAAAAO9CvbAAAAdVBMVEUAAAD8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5D8a5B6wgeiAAAAJnRSTlMA+kdM91na9emwPDAIzcC3qZyTfnI0FAQm4d/Rx8KGamMqHg4MJ70UX+oAAAEsSURBVEjHndXZkoMgEAXQdFjct6jR7Ov0/3/iVMZJUIw0cB8pT1HcEnplCMuCjK38EgMiQuyHc3wl99sYh3htXfzjwsMm+E7ijssPLp1tjyo/rrga4crR3mGE4e6GNzjOxslu+QTzrbV8tCLCaSLRPgjV9ayp8hC/J8yrhvXdVxmXEpAOyDKeWaYk6ZmOD2ifg465A+Y6Pjrgo47bwNoG7ayxdWBr1wq5aj7YmeaeVmna+moY2bkG6t8yhQFpaU1b+g1xfU+iRRzRWC5iSdrUcOaUnjLLSSgsDFhQ+GzAZ4uy/euWBiztyqbrpss+iZNWt3XZ2fp1zzL7umt1wPeXQtVQm/EFh+yunRph1x0OuRCzNfybaU06rbEZlqlJeytgXz9ny896D8VNX/0FTnubW+H0LlAAAAAASUVORK5CYII=") repeat-x;
	background-size: auto 100%;
}