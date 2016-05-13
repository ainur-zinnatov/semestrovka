package repository;

import model.Word;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by hp on 12.05.2016.
 */

@Repository
public interface WordRepository extends JpaRepository<Word, Integer> {

    @Query("SELECT t FROM Word t where t.id in (select max(p.id) from Word p)" )
    Word findByMaxId();

    @Query("SELECT t FROM Word t where t.word=:word_" )
    Word findByWord(@Param("word_") String word);



}
