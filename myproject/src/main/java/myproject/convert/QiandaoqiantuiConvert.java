package myproject.convert;

import myproject.entity.QiandaoqiantuiEntity;
import myproject.vo.QiandaoqiantuiVO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
* 签到签退
*
*/
@Mapper
public interface QiandaoqiantuiConvert {
    QiandaoqiantuiConvert INSTANCE = Mappers.getMapper(QiandaoqiantuiConvert.class);

    QiandaoqiantuiEntity convert(QiandaoqiantuiVO vo);

    QiandaoqiantuiVO convert(QiandaoqiantuiEntity entity);

    List<QiandaoqiantuiVO> convertList(List<QiandaoqiantuiEntity> list);

    List<QiandaoqiantuiEntity> convertEntityList(List<QiandaoqiantuiVO> list);
}