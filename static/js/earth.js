// webgl 家庭成员   renderer渲染  mesh材质
        var camera, scene, renderer, mesh;
        var container;
        init();
        animate();
        function init() {
            container = document.getElementById('container');
            camera = new THREE.PerspectiveCamera(70, window.innerWidth/window.innerHeight, 1, 1000);
            camera.position.z = 180;
            scene = new THREE.Scene();
            renderer = new THREE.WebGLRenderer();
            //renderer.setSize(window.innerWidth, window.innerHeight);
			renderer.setSize(window.innerWidth*0.4, window.innerHeight*0.4);
            renderer.setClearColor(0x0B0F34); // 设置清除色
            // renderer.setClearColor(0xff0000);
            // canvas element
            container.appendChild(renderer.domElement);
            // 点的位置，点的构成            
            function latlngToXYZ (coord, radius) {
                var sphereArr = [];
                for(var i = 0; i < coord.length;i++) {
                    var lat = coord[i].lat;
                    var lng = coord[i].lng;
                    var radLat = (lat*Math.PI)/180;
                    var radLng = (lng * Math.PI/180);
                    var posZ = radius*Math.sin(radLat);
                    var subRadius = radius*Math.cos(radLat);
                    var posX = subRadius*Math.cos(radLng);
                    var posY = subRadius*Math.sin(radLng);
                    sphereArr.push({
                        x: posX,
                        y: posY,
                        z: posZ
                    })
                }
                return sphereArr;
            }
            var posxyz = latlngToXYZ(chinaData, 100);
            console.log(posxyz);
            var geometry = new THREE.Geometry();
            var length = posxyz.length;
            for (var i = 0; i < length; i++) {
                var vertex = new THREE.Vector3(posxyz[i].x, posxyz[i].y, posxyz[i].z);
                geometry.vertices.push(vertex);
            }
            // 表象
            var material = new THREE.PointsMaterial({size: 1, color: 0x00ffff});
            var partcle = new THREE.Points(geometry, material);
            scene.add(partcle);
        }
        function animate () {
            // 关键帧动画  请求运动帧
            requestAnimationFrame(animate)
            render();
            scene.rotation.x += 0.01;
            scene.rotation.y += 0.01;
        }
        function render () {
            // 关键在场景scene的设置， 相机的摆放camera
            renderer.render(scene, camera);
        }