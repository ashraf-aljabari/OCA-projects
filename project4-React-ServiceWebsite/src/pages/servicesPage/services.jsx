import Cards from '../../component/Cards/servicesCards';
import Coverflow from '../../component/Coverflow/Coverflow';
import './style.css';
export default function services() {
  return (
    <section className='services-page'>
      <Coverflow />
      <Cards className='Cards' />
    </section>
  );
}
