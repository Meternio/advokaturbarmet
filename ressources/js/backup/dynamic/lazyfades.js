export class LazyFades{constructor(){this.items=document.querySelectorAll(".component")}init(){let t=new IntersectionObserver((function(e,o){e.forEach((async e=>{if(e.isIntersecting){let o=e.target;await delay(250),gsap.fromTo([o],{opacity:0},{opacity:1,duration:1}),t.unobserve(o)}}))}));this.items.forEach((function(e){t.observe(e)}))}update(){this.items=document.querySelectorAll(".component"),this.init()}}
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImR5bmFtaWMvbGF6eWZhZGVzLmpzIl0sIm5hbWVzIjpbIkxhenlGYWRlcyIsIltvYmplY3QgT2JqZWN0XSIsInRoaXMiLCJpdGVtcyIsImRvY3VtZW50IiwicXVlcnlTZWxlY3RvckFsbCIsImltYWdlT2JzZXJ2ZXIiLCJJbnRlcnNlY3Rpb25PYnNlcnZlciIsImVudHJpZXMiLCJvYnNlcnZlciIsImZvckVhY2giLCJhc3luYyIsImVudHJ5IiwiaXNJbnRlcnNlY3RpbmciLCJjb250YWluZXIiLCJ0YXJnZXQiLCJkZWxheSIsImdzYXAiLCJmcm9tVG8iLCJvcGFjaXR5IiwiZHVyYXRpb24iLCJ1bm9ic2VydmUiLCJvYnNlcnZlIiwiaW5pdCJdLCJtYXBwaW5ncyI6Ik9BQU8sTUFBTUEsVUFDVEMsY0FDSUMsS0FBS0MsTUFBUUMsU0FBU0MsaUJBQWlCLGNBRzNDSixPQUNJLElBQUlLLEVBQWdCLElBQUlDLHNCQUFzQixTQUFVQyxFQUFTQyxHQUM3REQsRUFBUUUsU0FBUUMsTUFBT0MsSUFDbkIsR0FBSUEsRUFBTUMsZUFBZ0IsQ0FDdEIsSUFBSUMsRUFBWUYsRUFBTUcsYUFDaEJDLE1BQU0sS0FDWkMsS0FBS0MsT0FBTyxDQUFDSixHQUFZLENBQUNLLFFBQVMsR0FBSSxDQUFDQSxRQUFTLEVBQUdDLFNBQVUsSUFDOURkLEVBQWNlLFVBQVVQLFVBS3BDWixLQUFLQyxNQUFNTyxTQUFRLFNBQVNJLEdBQ3hCUixFQUFjZ0IsUUFBUVIsTUFJOUJiLFNBQ0lDLEtBQUtDLE1BQVFDLFNBQVNDLGlCQUFpQixjQUN2Q0gsS0FBS3FCIiwiZmlsZSI6ImR5bmFtaWMvbGF6eWZhZGVzLmpzIiwic291cmNlc0NvbnRlbnQiOlsiZXhwb3J0IGNsYXNzIExhenlGYWRlcyB7XG4gICAgY29uc3RydWN0b3IoKSB7XG4gICAgICAgIHRoaXMuaXRlbXMgPSBkb2N1bWVudC5xdWVyeVNlbGVjdG9yQWxsKCcuY29tcG9uZW50Jyk7XG4gICAgfVxuXG4gICAgaW5pdCgpIHtcbiAgICAgICAgbGV0IGltYWdlT2JzZXJ2ZXIgPSBuZXcgSW50ZXJzZWN0aW9uT2JzZXJ2ZXIgKGZ1bmN0aW9uIChlbnRyaWVzLCBvYnNlcnZlcikge1xuICAgICAgICAgICAgZW50cmllcy5mb3JFYWNoKGFzeW5jIChlbnRyeSk9PiB7XG4gICAgICAgICAgICAgICAgaWYgKGVudHJ5LmlzSW50ZXJzZWN0aW5nKSB7XG4gICAgICAgICAgICAgICAgICAgIGxldCBjb250YWluZXIgPSBlbnRyeS50YXJnZXQ7XG4gICAgICAgICAgICAgICAgICAgIGF3YWl0IGRlbGF5KDI1MCk7XG4gICAgICAgICAgICAgICAgICAgIGdzYXAuZnJvbVRvKFtjb250YWluZXJdLCB7b3BhY2l0eTogMH0sIHtvcGFjaXR5OiAxLCBkdXJhdGlvbjogMX0pO1xuICAgICAgICAgICAgICAgICAgICBpbWFnZU9ic2VydmVyLnVub2JzZXJ2ZShjb250YWluZXIpO1xuICAgICAgICAgICAgICAgIH1cbiAgICAgICAgICAgIH0pO1xuICAgICAgICB9KTtcblxuICAgICAgICB0aGlzLml0ZW1zLmZvckVhY2goZnVuY3Rpb24oY29udGFpbmVyKSB7XG4gICAgICAgICAgICBpbWFnZU9ic2VydmVyLm9ic2VydmUoY29udGFpbmVyKTtcbiAgICAgICAgfSk7XG4gICAgfVxuXG4gICAgdXBkYXRlKCkge1xuICAgICAgICB0aGlzLml0ZW1zID0gZG9jdW1lbnQucXVlcnlTZWxlY3RvckFsbCgnLmNvbXBvbmVudCcpO1xuICAgICAgICB0aGlzLmluaXQoKTtcbiAgICB9XG59Il19
