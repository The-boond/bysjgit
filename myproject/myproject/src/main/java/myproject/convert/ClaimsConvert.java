package myproject.convert;

import myproject.entity.ClaimsEntity;
import myproject.vo.ClaimsVO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
* 报销申请
*
*/
@Mapper
public interface ClaimsConvert {
    ClaimsConvert INSTANCE = Mappers.getMapper(ClaimsConvert.class);

    ClaimsEntity convert(ClaimsVO vo);

    ClaimsVO convert(ClaimsEntity entity);

    List<ClaimsVO> convertList(List<ClaimsEntity> list);

    List<ClaimsEntity> convertEntityList(List<ClaimsVO> list);
}