export class ThumbFader{constructor(){this.parents=document.querySelectorAll(".thumbnail__row"),this.delay=4e3}showImage(t,e){gsap.fromTo([t],{opacity:0},{opacity:1,duration:1}),t.style.zIndex=e}init(){for(let t=0,e=this.parents.length;t<e;t++){let e=1,l=1,i=this.parents[t].querySelectorAll(".thumbnail"),r=i.length;rInterval((()=>{Client.windowWidth<768&&(this.showImage(i[e],l+1),l+=1,e=e+1>r-1?0:e+1)}),this.delay)}}update(){this.parents=document.querySelectorAll(".thumbnail__row"),this.init()}}
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImR5bmFtaWMvdGh1bWJuYWlsRmFkZXIuanMiXSwibmFtZXMiOlsiVGh1bWJGYWRlciIsIltvYmplY3QgT2JqZWN0XSIsInRoaXMiLCJwYXJlbnRzIiwiZG9jdW1lbnQiLCJxdWVyeVNlbGVjdG9yQWxsIiwiZGVsYXkiLCJpdGVtIiwiekluZGV4IiwiZ3NhcCIsImZyb21UbyIsIm9wYWNpdHkiLCJkdXJhdGlvbiIsInN0eWxlIiwiaSIsImxlbiIsImxlbmd0aCIsImluZGV4IiwiaXRlbXMiLCJySW50ZXJ2YWwiLCJDbGllbnQiLCJ3aW5kb3dXaWR0aCIsInNob3dJbWFnZSIsImluaXQiXSwibWFwcGluZ3MiOiJPQUFPLE1BQU1BLFdBQ1RDLGNBQ0lDLEtBQUtDLFFBQVVDLFNBQVNDLGlCQUFpQixtQkFDekNILEtBQUtJLE1BQVEsSUFHakJMLFVBQVVNLEVBQU1DLEdBQ1pDLEtBQUtDLE9BQU8sQ0FBQ0gsR0FBTyxDQUFDSSxRQUFTLEdBQUksQ0FBQ0EsUUFBUyxFQUFHQyxTQUFVLElBQ3pETCxFQUFLTSxNQUFNTCxPQUFRQSxFQUd2QlAsT0FDSSxJQUFLLElBQUlhLEVBQUksRUFBR0MsRUFBTWIsS0FBS0MsUUFBUWEsT0FBUUYsRUFBSUMsRUFBS0QsSUFBSyxDQUNyRCxJQUFJRyxFQUFRLEVBQ1JULEVBQVMsRUFDVFUsRUFBUWhCLEtBQUtDLFFBQVFXLEdBQUdULGlCQUFpQixjQUN6Q1csRUFBU0UsRUFBTUYsT0FFSkcsV0FBVSxLQUNsQkMsT0FBT0MsWUFBYyxNQUNwQm5CLEtBQUtvQixVQUFVSixFQUFNRCxHQUFRVCxFQUFTLEdBQ3RDQSxHQUFrQixFQUNsQlMsRUFBUUEsRUFBUSxFQUFJRCxFQUFTLEVBQUksRUFBSUMsRUFBUSxLQUVsRGYsS0FBS0ksUUFJaEJMLFNBQ0lDLEtBQUtDLFFBQVVDLFNBQVNDLGlCQUFpQixtQkFDekNILEtBQUtxQiIsImZpbGUiOiJkeW5hbWljL3RodW1ibmFpbEZhZGVyLmpzIiwic291cmNlc0NvbnRlbnQiOlsiZXhwb3J0IGNsYXNzIFRodW1iRmFkZXIge1xuICAgIGNvbnN0cnVjdG9yKCkge1xuICAgICAgICB0aGlzLnBhcmVudHMgPSBkb2N1bWVudC5xdWVyeVNlbGVjdG9yQWxsKCcudGh1bWJuYWlsX19yb3cnKTtcbiAgICAgICAgdGhpcy5kZWxheSA9IDQwMDA7XG4gICAgfVxuXG4gICAgc2hvd0ltYWdlKGl0ZW0sIHpJbmRleCkge1xuICAgICAgICBnc2FwLmZyb21UbyhbaXRlbV0sIHtvcGFjaXR5OiAwfSwge29wYWNpdHk6IDEsIGR1cmF0aW9uOiAxfSk7XG4gICAgICAgIGl0ZW0uc3R5bGUuekluZGV4ID16SW5kZXg7XG4gICAgfVxuXG4gICAgaW5pdCgpIHtcbiAgICAgICAgZm9yIChsZXQgaSA9IDAsIGxlbiA9IHRoaXMucGFyZW50cy5sZW5ndGg7IGkgPCBsZW47IGkrKykge1xuICAgICAgICAgICAgbGV0IGluZGV4ID0gMTtcbiAgICAgICAgICAgIGxldCB6SW5kZXggPSAxO1xuICAgICAgICAgICAgbGV0IGl0ZW1zID0gdGhpcy5wYXJlbnRzW2ldLnF1ZXJ5U2VsZWN0b3JBbGwoJy50aHVtYm5haWwnKTtcbiAgICAgICAgICAgIGxldCBsZW5ndGggPSBpdGVtcy5sZW5ndGg7XG5cbiAgICAgICAgICAgIGxldCBpbnRlcnZhbCA9IHJJbnRlcnZhbCgoKSA9PiB7XG4gICAgICAgICAgICAgICAgaWYoQ2xpZW50LndpbmRvd1dpZHRoIDwgNzY4KSB7XG4gICAgICAgICAgICAgICAgICAgIHRoaXMuc2hvd0ltYWdlKGl0ZW1zW2luZGV4XSwgekluZGV4ICsgMSk7XG4gICAgICAgICAgICAgICAgICAgIHpJbmRleCA9IHpJbmRleCArIDE7XG4gICAgICAgICAgICAgICAgICAgIGluZGV4ID0gaW5kZXggKyAxID4gbGVuZ3RoIC0gMSA/IDAgOiBpbmRleCArIDE7XG4gICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgfSwgdGhpcy5kZWxheSlcbiAgICAgICAgfVxuICAgIH1cblxuICAgIHVwZGF0ZSgpIHtcbiAgICAgICAgdGhpcy5wYXJlbnRzID0gZG9jdW1lbnQucXVlcnlTZWxlY3RvckFsbCgnLnRodW1ibmFpbF9fcm93Jyk7XG4gICAgICAgIHRoaXMuaW5pdCgpO1xuICAgIH1cbn0iXX0=
