{def $locale = fetch('content', 'locale')
     $indexInc = 0
     $indexExc = 0}
{if ezhttp_hasvariable( concat( $attribute_base, '_ezpe_valid_days_', $attribute.id ), 'post' )}
     {def $postDataDays = ezhttp( concat( $attribute_base, '_ezpe_valid_days_', $attribute.id ), 'post' )}
{/if}
{if ezhttp_hasvariable( concat( $attribute_base, '_ezpeventdate_data_', $attribute.id ), 'post' )}
    {def $postData = ezhttp( concat( $attribute_base, '_ezpeventdate_data_', $attribute.id ), 'post' )}
    {if is_set( $postData.include )}
        {def $postInclude = $postData.include}
    {/if}
    {if is_set( $postData.exclude )}
        {def $postExclude = $postData.exclude}
    {/if}
{/if}
{if $attribute.has_content}
    {def $content = $attribute.content}
    {if is_set( $content.include )}
        {def $attrInclude = $content.include}
    {/if}
    {if is_set( $content.exclude )}
        {def $attrExclude = $content.exclude}
    {/if}
{/if}
{ezcss_require(array('jquery-ui.css', 'xrowevent.css'))}
{ezscript_require(array('ezjsc::jqueryUI', 'xrowevent.js'))}
<input type="hidden" class="ezpevent" id="ezpevent{$attribute.id}" data-attrid="{$attribute.id}" data-locale="{$locale.http_locale_code|extract(0,2)}" />
<input type="hidden" value="{$locale.http_locale_code|extract(0,2)}" name="{$attribute_base}_ezpeventdate_data_{$attribute.id}[locale]" class="ezpeventdate_data_locale" />
<fieldset>
    <legend>{'Periods'|i18n( 'extension/ezpublish-event' )}</legend>
{if is_set( $postInclude )}
    {foreach $postInclude as $indexInc => $postIncludeItem}
        {include uri='design:content/datatype/edit/includeperiod.tpl' index=$indexInc item=$postIncludeItem}
    {/foreach}
    <input type="hidden" id="counterInclude{$attribute.id}" data-counter="{$postInclude|count()}" />
{elseif is_set( $attrInclude )}
    {foreach $attrInclude as $indexInc => $attrIncludeItem}
        {include uri='design:content/datatype/edit/includeperiod.tpl' index=$indexInc item=$attrIncludeItem}
    {/foreach}
    <input type="hidden" id="counterInclude{$attribute.id}" data-counter="{$attrInclude|count()}" />
{else}
    {include uri='design:content/datatype/edit/includeperiod.tpl' index=$indexInc}
{/if}
    <hr class="ezpeventhr" />
    <button class="ezpevent_add_period" data-index="{$indexInc}">{'Add new period'|i18n( 'extension/ezpublish-event' )}</button>
    <br />
</fieldset>

<fieldset>
    <legend>{'Exclude periods'|i18n( 'extension/ezpublish-event' )}</legend>
{if is_set( $postExclude )}
    {foreach $postExclude as $indexExc => $postExcludeItem}
        {include uri='design:content/datatype/edit/excludeperiod.tpl' index=$indexExc item=$postExcludeItem}
    {/foreach}
    <input type="hidden" id="counterExclude{$attribute.id}" data-counter="{$postExclude|count()}" />
{elseif is_set( $attrExclude )}
    {foreach $attrExclude as $indexExc => $attrExcludeItem}
        {include uri='design:content/datatype/edit/excludeperiod.tpl' index=$indexExc item=$attrExcludeItem}
    {/foreach}
    <input type="hidden" id="counterExclude{$attribute.id}" data-counter="{$attrExclude|count()}" />
{else}
    {include uri='design:content/datatype/edit/excludeperiod.tpl' index=$indexExc}
{/if}
    <hr />
    <button class="ezpevent_add_exclude_period" data-index="{$indexExc}">{'Exclude further periods'|i18n( 'extension/ezpublish-event' )}</button><br />
</fieldset>