export class AddNullInteract{constructor(){this.NullInteract=class{constructor(t){this.element=t.element,this.isTouch=Client.isTouch,this.actions={pressed:!1},this.handlers={onStart:this.isTouch?"touchstart":"mousedown",onMove:this.isTouch?"touchmove":"mousemove",onEnd:this.isTouch?"touchend":"mouseup"},this.result={distanceX:0,distanceY:0,startX:0,startY:0,deltaX:0,deltaY:0},this.callbacks={onStart:t.onStart,onMove:t.onMove,onEnd:t.onEnd},this.init()}onStart(t){this.actions.pressed=!0,this.result.startX=this.isTouch?t.touches[0].screenX:t.screenX,this.result.startY=this.isTouch?t.touches[0].screenY:t.screenY,void 0!==this.callbacks.onStart&&this.callbacks.onStart.bind(this)()}onMove(t){this.actions.pressed&&(this.result.deltaX=this.isTouch?-1*(this.result.startX-t.touches[0].screenX):-1*(this.result.startX-t.screenX),this.result.deltaY=this.isTouch?-1*(this.result.startY-t.touches[0].screenY):-1*(this.result.startY-t.screenY),this.result.distanceX=Math.abs(this.result.deltaX),this.result.distanceY=Math.abs(this.result.deltaY),void 0!==this.callbacks.onMove&&this.callbacks.onMove.bind(this)())}onEnd(t){void 0!==this.callbacks.onEnd&&this.callbacks.onEnd.bind(this)(),this.actions.pressed=!1,this.result={distanceX:0,distanceY:0,startX:0,startY:0,deltaX:0,deltaY:0}}init(){this.element.addEventListener(this.handlers.onStart,(t=>{this.onStart(t)})),document.body.addEventListener(this.handlers.onEnd,(t=>{this.onEnd(t)})),document.body.addEventListener(this.handlers.onMove,(t=>{this.onMove(t)}))}}}init(){window.NullInteract=this.NullInteract}}
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImhlbHBlcnMvbnVsbEludGVyYWN0LmpzIl0sIm5hbWVzIjpbIkFkZE51bGxJbnRlcmFjdCIsIltvYmplY3QgT2JqZWN0XSIsInRoaXMiLCJOdWxsSW50ZXJhY3QiLCJvYmoiLCJlbGVtZW50IiwiaXNUb3VjaCIsIkNsaWVudCIsImFjdGlvbnMiLCJwcmVzc2VkIiwiaGFuZGxlcnMiLCJvblN0YXJ0Iiwib25Nb3ZlIiwib25FbmQiLCJyZXN1bHQiLCJkaXN0YW5jZVgiLCJkaXN0YW5jZVkiLCJzdGFydFgiLCJzdGFydFkiLCJkZWx0YVgiLCJkZWx0YVkiLCJjYWxsYmFja3MiLCJpbml0IiwiZSIsInRvdWNoZXMiLCJzY3JlZW5YIiwic2NyZWVuWSIsInVuZGVmaW5lZCIsImJpbmQiLCJNYXRoIiwiYWJzIiwiYWRkRXZlbnRMaXN0ZW5lciIsImRvY3VtZW50IiwiYm9keSIsIndpbmRvdyJdLCJtYXBwaW5ncyI6Ik9BQU8sTUFBTUEsZ0JBQ1RDLGNBRUlDLEtBQUtDLGFBQWUsTUFDaEJGLFlBQVlHLEdBQ1JGLEtBQUtHLFFBQVVELEVBQWEsUUFDNUJGLEtBQUtJLFFBQVVDLE9BQU9ELFFBRXRCSixLQUFLTSxRQUFVLENBQ1hDLFNBQVcsR0FHZlAsS0FBS1EsU0FBVyxDQUNaQyxRQUFXVCxLQUFLSSxRQUFVLGFBQWUsWUFDekNNLE9BQVVWLEtBQUtJLFFBQVUsWUFBYyxZQUN2Q08sTUFBU1gsS0FBS0ksUUFBVSxXQUFhLFdBR3pDSixLQUFLWSxPQUFTLENBQ1ZDLFVBQWEsRUFDYkMsVUFBYSxFQUNiQyxPQUFVLEVBQ1ZDLE9BQVUsRUFDVkMsT0FBVSxFQUNWQyxPQUFVLEdBR2RsQixLQUFLbUIsVUFBWSxDQUNiVixRQUFXUCxFQUFhLFFBQ3hCUSxPQUFVUixFQUFZLE9BQ3RCUyxNQUFTVCxFQUFXLE9BR3hCRixLQUFLb0IsT0FHVHJCLFFBQVFzQixHQUNKckIsS0FBS00sUUFBUUMsU0FBVSxFQUN2QlAsS0FBS1ksT0FBT0csT0FBU2YsS0FBS0ksUUFBVWlCLEVBQUVDLFFBQVEsR0FBR0MsUUFBVUYsRUFBRUUsUUFDN0R2QixLQUFLWSxPQUFPSSxPQUFTaEIsS0FBS0ksUUFBVWlCLEVBQUVDLFFBQVEsR0FBR0UsUUFBVUgsRUFBRUcsYUFFOUJDLElBQTNCekIsS0FBS21CLFVBQVVWLFNBQ2ZULEtBQUttQixVQUFVVixRQUFRaUIsS0FBSzFCLEtBQTVCQSxHQUlSRCxPQUFPc0IsR0FDQ3JCLEtBQUtNLFFBQVFDLFVBQ2JQLEtBQUtZLE9BQU9LLE9BQVNqQixLQUFLSSxTQUF5RCxHQUE5Q0osS0FBS1ksT0FBT0csT0FBU00sRUFBRUMsUUFBUSxHQUFHQyxVQUFvRCxHQUFuQ3ZCLEtBQUtZLE9BQU9HLE9BQVNNLEVBQUVFLFNBQy9HdkIsS0FBS1ksT0FBT00sT0FBU2xCLEtBQUtJLFNBQXlELEdBQTlDSixLQUFLWSxPQUFPSSxPQUFTSyxFQUFFQyxRQUFRLEdBQUdFLFVBQW9ELEdBQW5DeEIsS0FBS1ksT0FBT0ksT0FBU0ssRUFBRUcsU0FDL0d4QixLQUFLWSxPQUFPQyxVQUFZYyxLQUFLQyxJQUFJNUIsS0FBS1ksT0FBT0ssUUFDN0NqQixLQUFLWSxPQUFPRSxVQUFZYSxLQUFLQyxJQUFJNUIsS0FBS1ksT0FBT00sYUFFZk8sSUFBMUJ6QixLQUFLbUIsVUFBVVQsUUFDZlYsS0FBS21CLFVBQVVULE9BQU9nQixLQUFLMUIsS0FBM0JBLElBS1pELE1BQU1zQixRQUMyQkksSUFBekJ6QixLQUFLbUIsVUFBVVIsT0FDZlgsS0FBS21CLFVBQVVSLE1BQU1lLEtBQUsxQixLQUExQkEsR0FHSkEsS0FBS00sUUFBUUMsU0FBVSxFQUV2QlAsS0FBS1ksT0FBUyxDQUNWQyxVQUFhLEVBQ2JDLFVBQWEsRUFDYkMsT0FBVSxFQUNWQyxPQUFVLEVBQ1ZDLE9BQVUsRUFDVkMsT0FBVSxHQUlsQm5CLE9BQ0lDLEtBQUtHLFFBQVEwQixpQkFBaUI3QixLQUFLUSxTQUFTQyxTQUFVWSxJQUNsRHJCLEtBQUtTLFFBQVFZLE1BRWpCUyxTQUFTQyxLQUFLRixpQkFBaUI3QixLQUFLUSxTQUFTRyxPQUFRVSxJQUNqRHJCLEtBQUtXLE1BQU1VLE1BRWZTLFNBQVNDLEtBQUtGLGlCQUFpQjdCLEtBQUtRLFNBQVNFLFFBQVNXLElBQ2xEckIsS0FBS1UsT0FBT1csUUFNNUJ0QixPQUNJaUMsT0FBTy9CLGFBQWVELEtBQUtDIiwiZmlsZSI6ImhlbHBlcnMvbnVsbEludGVyYWN0LmpzIiwic291cmNlc0NvbnRlbnQiOlsiZXhwb3J0IGNsYXNzIEFkZE51bGxJbnRlcmFjdCB7XG4gICAgY29uc3RydWN0b3IoKSB7XG5cbiAgICAgICAgdGhpcy5OdWxsSW50ZXJhY3QgPSBjbGFzcyBOdWxsSW50ZXJhY3Qge1xuICAgICAgICAgICAgY29uc3RydWN0b3Iob2JqKSB7XG4gICAgICAgICAgICAgICAgdGhpcy5lbGVtZW50ID0gb2JqWydlbGVtZW50J107XG4gICAgICAgICAgICAgICAgdGhpcy5pc1RvdWNoID0gQ2xpZW50LmlzVG91Y2g7XG5cbiAgICAgICAgICAgICAgICB0aGlzLmFjdGlvbnMgPSB7XG4gICAgICAgICAgICAgICAgICAgICdwcmVzc2VkJzogZmFsc2UsXG4gICAgICAgICAgICAgICAgfVxuXG4gICAgICAgICAgICAgICAgdGhpcy5oYW5kbGVycyA9IHtcbiAgICAgICAgICAgICAgICAgICAgJ29uU3RhcnQnOiB0aGlzLmlzVG91Y2ggPyAndG91Y2hzdGFydCcgOiAnbW91c2Vkb3duJyxcbiAgICAgICAgICAgICAgICAgICAgJ29uTW92ZSc6IHRoaXMuaXNUb3VjaCA/ICd0b3VjaG1vdmUnIDogJ21vdXNlbW92ZScsXG4gICAgICAgICAgICAgICAgICAgICdvbkVuZCc6IHRoaXMuaXNUb3VjaCA/ICd0b3VjaGVuZCcgOiAnbW91c2V1cCdcbiAgICAgICAgICAgICAgICB9XG5cbiAgICAgICAgICAgICAgICB0aGlzLnJlc3VsdCA9IHtcbiAgICAgICAgICAgICAgICAgICAgJ2Rpc3RhbmNlWCc6IDAsXG4gICAgICAgICAgICAgICAgICAgICdkaXN0YW5jZVknOiAwLFxuICAgICAgICAgICAgICAgICAgICAnc3RhcnRYJzogMCxcbiAgICAgICAgICAgICAgICAgICAgJ3N0YXJ0WSc6IDAsXG4gICAgICAgICAgICAgICAgICAgICdkZWx0YVgnOiAwLFxuICAgICAgICAgICAgICAgICAgICAnZGVsdGFZJzogMFxuICAgICAgICAgICAgICAgIH1cblxuICAgICAgICAgICAgICAgIHRoaXMuY2FsbGJhY2tzID0ge1xuICAgICAgICAgICAgICAgICAgICAnb25TdGFydCc6IG9ialsnb25TdGFydCddLFxuICAgICAgICAgICAgICAgICAgICAnb25Nb3ZlJzogb2JqWydvbk1vdmUnXSxcbiAgICAgICAgICAgICAgICAgICAgJ29uRW5kJzogb2JqWydvbkVuZCddLFxuICAgICAgICAgICAgICAgIH1cblxuICAgICAgICAgICAgICAgIHRoaXMuaW5pdCgpO1xuICAgICAgICAgICAgfVxuXG4gICAgICAgICAgICBvblN0YXJ0KGUpIHtcbiAgICAgICAgICAgICAgICB0aGlzLmFjdGlvbnMucHJlc3NlZCA9IHRydWU7XG4gICAgICAgICAgICAgICAgdGhpcy5yZXN1bHQuc3RhcnRYID0gdGhpcy5pc1RvdWNoID8gZS50b3VjaGVzWzBdLnNjcmVlblggOiBlLnNjcmVlblg7XG4gICAgICAgICAgICAgICAgdGhpcy5yZXN1bHQuc3RhcnRZID0gdGhpcy5pc1RvdWNoID8gZS50b3VjaGVzWzBdLnNjcmVlblkgOiBlLnNjcmVlblk7XG5cbiAgICAgICAgICAgICAgICBpZiAodGhpcy5jYWxsYmFja3Mub25TdGFydCAhPT0gdW5kZWZpbmVkKSB7XG4gICAgICAgICAgICAgICAgICAgIHRoaXMuY2FsbGJhY2tzLm9uU3RhcnQuYmluZCh0aGlzKSgpO1xuICAgICAgICAgICAgICAgIH1cbiAgICAgICAgICAgIH1cblxuICAgICAgICAgICAgb25Nb3ZlKGUpIHtcbiAgICAgICAgICAgICAgICBpZiAodGhpcy5hY3Rpb25zLnByZXNzZWQpIHtcbiAgICAgICAgICAgICAgICAgICAgdGhpcy5yZXN1bHQuZGVsdGFYID0gdGhpcy5pc1RvdWNoID8gKHRoaXMucmVzdWx0LnN0YXJ0WCAtIGUudG91Y2hlc1swXS5zY3JlZW5YKSAqIC0xIDogKHRoaXMucmVzdWx0LnN0YXJ0WCAtIGUuc2NyZWVuWCkgKiAtMTtcbiAgICAgICAgICAgICAgICAgICAgdGhpcy5yZXN1bHQuZGVsdGFZID0gdGhpcy5pc1RvdWNoID8gKHRoaXMucmVzdWx0LnN0YXJ0WSAtIGUudG91Y2hlc1swXS5zY3JlZW5ZKSAqIC0xIDogKHRoaXMucmVzdWx0LnN0YXJ0WSAtIGUuc2NyZWVuWSkgKiAtMTtcbiAgICAgICAgICAgICAgICAgICAgdGhpcy5yZXN1bHQuZGlzdGFuY2VYID0gTWF0aC5hYnModGhpcy5yZXN1bHQuZGVsdGFYKTtcbiAgICAgICAgICAgICAgICAgICAgdGhpcy5yZXN1bHQuZGlzdGFuY2VZID0gTWF0aC5hYnModGhpcy5yZXN1bHQuZGVsdGFZKTtcblxuICAgICAgICAgICAgICAgICAgICBpZiAodGhpcy5jYWxsYmFja3Mub25Nb3ZlICE9PSB1bmRlZmluZWQpIHtcbiAgICAgICAgICAgICAgICAgICAgICAgIHRoaXMuY2FsbGJhY2tzLm9uTW92ZS5iaW5kKHRoaXMpKCk7XG4gICAgICAgICAgICAgICAgICAgIH1cbiAgICAgICAgICAgICAgICB9XG4gICAgICAgICAgICB9XG5cbiAgICAgICAgICAgIG9uRW5kKGUpIHtcbiAgICAgICAgICAgICAgICBpZiAodGhpcy5jYWxsYmFja3Mub25FbmQgIT09IHVuZGVmaW5lZCkge1xuICAgICAgICAgICAgICAgICAgICB0aGlzLmNhbGxiYWNrcy5vbkVuZC5iaW5kKHRoaXMpKCk7XG4gICAgICAgICAgICAgICAgfVxuXG4gICAgICAgICAgICAgICAgdGhpcy5hY3Rpb25zLnByZXNzZWQgPSBmYWxzZTtcblxuICAgICAgICAgICAgICAgIHRoaXMucmVzdWx0ID0ge1xuICAgICAgICAgICAgICAgICAgICAnZGlzdGFuY2VYJzogMCxcbiAgICAgICAgICAgICAgICAgICAgJ2Rpc3RhbmNlWSc6IDAsXG4gICAgICAgICAgICAgICAgICAgICdzdGFydFgnOiAwLFxuICAgICAgICAgICAgICAgICAgICAnc3RhcnRZJzogMCxcbiAgICAgICAgICAgICAgICAgICAgJ2RlbHRhWCc6IDAsXG4gICAgICAgICAgICAgICAgICAgICdkZWx0YVknOiAwXG4gICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgfVxuXG4gICAgICAgICAgICBpbml0KCkge1xuICAgICAgICAgICAgICAgIHRoaXMuZWxlbWVudC5hZGRFdmVudExpc3RlbmVyKHRoaXMuaGFuZGxlcnMub25TdGFydCwgKGUpID0+IHtcbiAgICAgICAgICAgICAgICAgICAgdGhpcy5vblN0YXJ0KGUpO1xuICAgICAgICAgICAgICAgIH0pO1xuICAgICAgICAgICAgICAgIGRvY3VtZW50LmJvZHkuYWRkRXZlbnRMaXN0ZW5lcih0aGlzLmhhbmRsZXJzLm9uRW5kLCAoZSkgPT4ge1xuICAgICAgICAgICAgICAgICAgICB0aGlzLm9uRW5kKGUpO1xuICAgICAgICAgICAgICAgIH0pO1xuICAgICAgICAgICAgICAgIGRvY3VtZW50LmJvZHkuYWRkRXZlbnRMaXN0ZW5lcih0aGlzLmhhbmRsZXJzLm9uTW92ZSwgKGUpID0+IHtcbiAgICAgICAgICAgICAgICAgICAgdGhpcy5vbk1vdmUoZSlcbiAgICAgICAgICAgICAgICB9KTtcbiAgICAgICAgICAgIH1cbiAgICAgICAgfVxuICAgIH1cblxuICAgIGluaXQoKSB7XG4gICAgICAgIHdpbmRvdy5OdWxsSW50ZXJhY3QgPSB0aGlzLk51bGxJbnRlcmFjdDtcbiAgICB9XG59XG4iXX0=