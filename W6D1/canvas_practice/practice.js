document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById("mycanvas");
  canvas.width = 500;
  canvas.height = 500;
  const ctx = canvas.getContext("2d");
  ctx.fillStyle = "#b23774";
  ctx.fillRect(0,0,500,500);

  ctx.beginPath();
  ctx.arc(250,250,230.5,0,2*Math.PI);
  ctx.strokeStyle = "rgb(255,255,255)";
  ctx.lineWidth = 40;
  ctx.stroke();s

  ctx.fillStyle = "#4fad9c";
  ctx.fill();

  //
  ctx.fillStyle = "white";
  const diff = (230/(2**0.5));
  ctx.fillRect(250-diff,250-diff,2*diff,2*diff);

  ctx.fillStyle = "rgb(198, 0, 0, 0.8)";
  // const diff = (230/(2**0.5));
  ctx.fillRect(250-diff,250-diff,2*diff,2*diff);

});
