export class LazyLoad{constructor(){this.items=document.querySelectorAll("[data-lazy]")}init(){let t=new IntersectionObserver((function(e,r){e.forEach((function(e){if(e.isIntersecting){let r=e.target;r.innerHTML=r.getAttribute("data-markup"),r.removeAttribute("data-lazy"),r.removeAttribute("data-markup"),t.unobserve(r)}}))}));this.items.forEach((function(e){t.observe(e)}))}}
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbInN0YXRpYy9sYXp5bG9hZC5qcyJdLCJuYW1lcyI6WyJMYXp5TG9hZCIsIltvYmplY3QgT2JqZWN0XSIsInRoaXMiLCJpdGVtcyIsImRvY3VtZW50IiwicXVlcnlTZWxlY3RvckFsbCIsImltYWdlT2JzZXJ2ZXIiLCJJbnRlcnNlY3Rpb25PYnNlcnZlciIsImVudHJpZXMiLCJvYnNlcnZlciIsImZvckVhY2giLCJlbnRyeSIsImlzSW50ZXJzZWN0aW5nIiwiY29udGFpbmVyIiwidGFyZ2V0IiwiaW5uZXJIVE1MIiwiZ2V0QXR0cmlidXRlIiwicmVtb3ZlQXR0cmlidXRlIiwidW5vYnNlcnZlIiwib2JzZXJ2ZSJdLCJtYXBwaW5ncyI6Ik9BQU8sTUFBTUEsU0FDVEMsY0FDSUMsS0FBS0MsTUFBUUMsU0FBU0MsaUJBQWlCLGVBRzNDSixPQUNJLElBQUlLLEVBQWdCLElBQUlDLHNCQUFzQixTQUFVQyxFQUFTQyxHQUM3REQsRUFBUUUsU0FBUSxTQUFTQyxHQUNyQixHQUFJQSxFQUFNQyxlQUFnQixDQUN0QixJQUFJQyxFQUFZRixFQUFNRyxPQUN0QkQsRUFBVUUsVUFBWUYsRUFBVUcsYUFBYSxlQUU3Q0gsRUFBVUksZ0JBQWdCLGFBQzFCSixFQUFVSSxnQkFBZ0IsZUFFMUJYLEVBQWNZLFVBQVVMLFVBS3BDWCxLQUFLQyxNQUFNTyxTQUFRLFNBQVNHLEdBQ3hCUCxFQUFjYSxRQUFRTiIsImZpbGUiOiJzdGF0aWMvbGF6eWxvYWQuanMiLCJzb3VyY2VzQ29udGVudCI6WyJleHBvcnQgY2xhc3MgTGF6eUxvYWQge1xuICAgIGNvbnN0cnVjdG9yKCkge1xuICAgICAgICB0aGlzLml0ZW1zID0gZG9jdW1lbnQucXVlcnlTZWxlY3RvckFsbCgnW2RhdGEtbGF6eV0nKTtcbiAgICB9XG5cbiAgICBpbml0KCkge1xuICAgICAgICBsZXQgaW1hZ2VPYnNlcnZlciA9IG5ldyBJbnRlcnNlY3Rpb25PYnNlcnZlciAoZnVuY3Rpb24gKGVudHJpZXMsIG9ic2VydmVyKSB7XG4gICAgICAgICAgICBlbnRyaWVzLmZvckVhY2goZnVuY3Rpb24oZW50cnkpIHtcbiAgICAgICAgICAgICAgICBpZiAoZW50cnkuaXNJbnRlcnNlY3RpbmcpIHtcbiAgICAgICAgICAgICAgICAgICAgbGV0IGNvbnRhaW5lciA9IGVudHJ5LnRhcmdldDtcbiAgICAgICAgICAgICAgICAgICAgY29udGFpbmVyLmlubmVySFRNTCA9IGNvbnRhaW5lci5nZXRBdHRyaWJ1dGUoJ2RhdGEtbWFya3VwJyk7XG5cbiAgICAgICAgICAgICAgICAgICAgY29udGFpbmVyLnJlbW92ZUF0dHJpYnV0ZSgnZGF0YS1sYXp5Jyk7XG4gICAgICAgICAgICAgICAgICAgIGNvbnRhaW5lci5yZW1vdmVBdHRyaWJ1dGUoJ2RhdGEtbWFya3VwJyk7XG5cbiAgICAgICAgICAgICAgICAgICAgaW1hZ2VPYnNlcnZlci51bm9ic2VydmUoY29udGFpbmVyKTtcbiAgICAgICAgICAgICAgICB9XG4gICAgICAgICAgICB9KTtcbiAgICAgICAgfSk7XG5cbiAgICAgICAgdGhpcy5pdGVtcy5mb3JFYWNoKGZ1bmN0aW9uKGNvbnRhaW5lcikge1xuICAgICAgICAgICAgaW1hZ2VPYnNlcnZlci5vYnNlcnZlKGNvbnRhaW5lcik7XG4gICAgICAgIH0pO1xuICAgIH1cbn0iXX0=
